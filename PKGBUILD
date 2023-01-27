# Maintainer: nomisge <nomisge @ live . de>
# Contributor: Quey-Liang Kao <s101062801@m101.nthu.edu.tw>
# Contributor: Michael Düll <mail@akurei.me>
# Contributor: sancspi <sancospi [at] gmail.com>
# Contributor: tze <tze@datalove.me>

pkgname=jcryptool
pkgver=1.0.8
pkgrel=1
pkgdesc="e-learning application for applying and analysing cryptographic algorithms"
arch=('x86_64')
url="https://www.cryptool.org/en/jct"
license=('EPL')
depends=('jre11-openjdk' 'libxext' 'libxrender' 'fontconfig')
_iconsrc='https://github.com/jcryptool/doc/raw/bfc66c1e952809edada1936dc5122f45400170de/Graphics/Icons/png/JCT_Icon_png_'
source=("https://github.com/jcryptool/core/releases/download/${pkgver}/${pkgname}-${pkgver}-Linux-64bit.tar.gz"
        'jcryptool.desktop'
        "jcryptool-16.png::${_iconsrc}16x16.png"
        "jcryptool-24.png::${_iconsrc}24x24.png"
        "jcryptool-32.png::${_iconsrc}32x32.png"
        "jcryptool-48.png::${_iconsrc}48x48.png"
        "jcryptool-128.png::${_iconsrc}128x128.png"
        "jcryptool-256.png::${_iconsrc}256x256.png"
        "jcryptool-512.png::${_iconsrc}512x512.png")
sha512sums=('8727d86117c49b2ae942c61d596216ac405fcb3cd8d170a73cb8505e70d91d0122ffbc8dcd7999e698ec2494e1d17ebdb2c791f497e88aa19b9f097428cd2c8d'
            '4b08c526016f27fa78bdcbe0f499236757c9e14e0548da8736d99b0d6f3e85fa7f84ac27b7f4922b2064802e92ec0e508848fb327a519b55f49bc5a0a9bda5e8'
            '02c728049ff612f4c77575aa557850d826fbf40b09e885a9de6e80429020b742f7193d7e0e572dff21a6bf091006f7d8fa7c377ea68b96ac01a60384b1dd1aff'
            '3df55b87975dc5ed5b475fc2cf9c55d21b29d1ec6ef34b8773b7e9c72ff39225c0ab6c34464b04ea57dd5b4d856d63686d78e0741c3f3a1300e276192c72a4c4'
            '1501993e1e992a6bb8b6d8ab7f8c072bc5f73917b3b51d82dd2b0f4da8036efa96098d703e36886bc2170fc51e56714a8999bcc88afa51b23b496c5eaa101b17'
            '45f642f77a0351f029f81c976aee322d165f38da3e10c94d3f8e29e87afe5831bb3cd5b276a8a20518782b1f9e73d4a9c40b2d52b465d95fd19bd2b6fdce6d52'
            '2515930d70709955f920d2c587c9363b3b36467d89b84fa961e65c943e9dd4841f53d47db12599876e722a7f402a12639934fb41548c4bb7e191450aa67598ac'
            '27bbfbce3d38f7ebbaa3e00d0f15626c9598fccef3d080e3ee3f20ec5de41c1d137d6dd0f2fcc605532fb5dd0615108f3d6ee098ad25be3ec35f765cb50fa1ea'
            '4b638f8df703fe670bc2f3b3b2d719249841e9c08665aece21b4bddaa8197ca06775799d44c6dcb6fbb74c3c8b858bd97f751c59478c17b558accec430a53c8e')

prepare() {
    cd "${srcdir}/jcryptool"
    #remove bundle jre and use system jre instead
    rm -R features/org.jcryptool.thirdparty.jre.linux64.*
    sed -i '/^features\/org\.jcryptool\.thirdparty\.jre\.linux64\./c\\/usr\/lib\/jvm\/java-11-openjdk\/bin\/java' ./JCrypTool.ini
}

package() {
    mkdir -p "${pkgdir}"/{opt,usr/bin}

    cp -R "${srcdir}/jcryptool/" "${pkgdir}/opt/"
 
    ln -s /opt/jcryptool/JCrypTool "${pkgdir}"/usr/bin/jcryptool

    install -Dm644 ${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    for _pic in 16 24 32 48 128 256 512; do
        install -Dm644 jcryptool-${_pic}.png "${pkgdir}"/usr/share/icons/hicolor/${_pic}x${_pic}/apps/${pkgname}.png
    done
}
