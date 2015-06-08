# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Liganic <liganic-aur@gmx.org>
# Contributor: Bernd Amend <berndamend@web.de>
# Contributor: Holodoc <archlinux@bananapro.de>

pkgname=giteye
pkgver=1.8.0
pkgrel=1
pkgdesc="A desktop for Git. It works with TeamForge, CloudForge, GitHub and other Git services."
arch=('i686' 'x86_64')
url="http://www.collab.net/giteyeapp"
license=('custom')
depends=('git' 'java-environment' 'python2')
makedepends=('unzip')
options=('!strip')
source=("https://downloads-guests.open.collab.net/files/documents/61/9413/GitEye-${pkgver}-linux.x86.zip"
        "LICENSE"
        "${pkgname}.desktop")
sha256sums=('260a2acfc486166834f1b0321f35607459fdc52f8f0a814c20fc277574054493'
            '76817988d60474b3e59b09bd2f6c35018d305e639b51751747d4af15ffec631b'
            '0cc7bb016275f8aad6864882194d6d88b6dfe6ccb2e8dba978960b7bed6f9e1d')

if [ "$CARCH" == "x86_64" ]; then
    source[0]="https://downloads-guests.open.collab.net/files/documents/61/9414/GitEye-${pkgver}-linux.x86_64.zip"
    sha256sums[0]='72ad76b1e0a597a1b476c0fc6d9febf000a3480beb1d492646ca3d00b5945ee8'
fi

noextract=(${source[@]##*/}) # extract nothing

package() {
    cd "${srcdir}"
    install -Ddm755 "${pkgdir}/opt/${pkgname}/"
    install -Ddm755 "${pkgdir}/usr/bin/"
    unzip ${noextract} -d "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/GitEye" "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname}/icon.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
    sed -i 's/python/python2/' "${pkgdir}/opt/giteye/plugins/org.apache.ant_1.8.4.v201303080030/bin/runant.py"
}
