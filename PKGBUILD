# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sebastian Stammler <base64 -d<<<c3RhbW1sZXJAY2JzLnR1LWRhcm1zdGFkdC5kZQo=>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-fonts
pkgver=0.0.20090806
pkgrel=4
pkgdesc='Fonts of the corporate-design for LaTeX from Technische Universität Darmstadt (Only available within the TUD-network!)'
arch=('any')
url='http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/'
license=('custom')
depends=('texlive-core' 'texlive-fontsextra')
source=("http://exp1.fkp.physik.tu-darmstadt.de/tuddesign/latex/tudfonts-tex/tudfonts-tex_${pkgver}.zip"
        ${pkgname}.maps)
sha512sums=('a963bac1e5c13a7152102b563b87cabf3e80e0809cd4c44ba63a63ab1825bb9b0b9adb3f28f72607407974ae7eb040037e07e3bc79a0ba9efa85f92b677dbc4f'
            '66bcf0beaf45cc9adf00ce2dc6a9ced32b943b43062276ded679100f108858c61aa1f7f8f84be3a33b1e2c9c8436ef5eda8e6ff4448ff3122b880b32a28a73fd')

package() {
    cd "${srcdir}/texmf"
    install -dm755 "${pkgdir}/usr/share/texmf/"

    for subdir in doc tex fonts; do
        cp -r ${subdir} "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;

    install -Dm644 "${srcdir}/${pkgname}.maps" "${pkgdir}/var/lib/texmf/arch/installedpkgs/${pkgname}.maps"
}
