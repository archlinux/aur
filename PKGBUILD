# Maintainer: Kye Hunter <kye(dot)evan(dot)hunter(at)gmail(dot)com>
# TODO needs a .install file, but I'll to see how things perform when upgrading kernel

pkgname=snd-hda-macbookpro-dkms-git
pkgver=0.1
pkgver() {
    sed -nr '/PACKAGE_VERSION/s/^.*="(.*)"$/\1/p' ${srcdir}/snd_hda_macbookpro/dkms.conf
}
pkgrel=1
pkgdesc="Kernel driver for sound on Macs with Cirrus 8409 HDA chips"
arch=(any)
url="https://github.com/davidjo/snd_hda_macbookpro"
license=('unknown')
install='snd_hda_macbookpro.install'
depends=(
    'git'
    'gcc'
    'make'
    'patch'
    'wget'
    'dkms'
)
makedepends=()
source=('git+https://github.com/davidjo/snd_hda_macbookpro.git')
sha256sums=('SKIP')

package() {
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro | grep -v '/$') ; do 
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver} \
            ${srcdir}/snd_hda_macbookpro/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patches | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver}/patches \
            ${srcdir}/snd_hda_macbookpro/patches/"$file"
    done
    for file in $(ls -p ${srcdir}/snd_hda_macbookpro/patch_cirrus | grep -v '/$') ; do
        install -D -m0644 -t \
            "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver}/patch_cirrus \
            ${srcdir}/snd_hda_macbookpro/patch_cirrus/"$file"
    done
    install -D -m0755 -t \
        "${pkgdir}"/usr/src/snd-hda-macbookpro-${pkgver} \
        "${srcdir}/snd_hda_macbookpro/install.cirrus.driver.sh"
}

