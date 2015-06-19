pkgname=('shotcut')
srcname='shotcut'
pkgdesc='Video editor'
pkgver='15.05'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://github.com/mltframework/shotcut'
license=('GPL3')

depends=(
    'qt5-base'
    'qt5-declarative'
    'qt5-graphicaleffects'
    'qt5-multimedia'
    'qt5-quickcontrols'
    'qt5-webkit'
    'qt5-x11extras'
    'mlt'
    'ffmpeg'
    'libx264'
    'libvpx'
    'lame'
    'frei0r-plugins'
    'ladspa'
)
makedepends=('git')
provides=('shotcut')
conflicts=('shotcut')

source=(
    "${srcname}::git+https://github.com/mltframework/shotcut.git#tag=v${pkgver}"
    'shotcut.desktop'
    'cutelogger.patch'
    'melt.patch'
)
sha512sums=(
    'SKIP'
    '38aefcdfb092a53aac7d7989ea55f6e2d8ab581c7976291b476974aebf853169c40607301ef64612a62d5de30ae7a13de54cb9a91827568b216cb2b30b0501cf'
    'fe18194558fca8096643528d239f91d0f7c948e58c8297e0338d6905e4df3732dd915eecc8bd25a62b1fba9731f21fcabc8f4ec32e45c46b74b061f549fb1c6a'
    '57063ccb11cb9bd061b807934afe5656d9e1e4a31850de2e60b6a0cdf4741c7975a2a548fdb5e7d2bb0a1e44635adb832d139ac55632a4e7f592952b67d17cfe'
)

prepare() {
    cd "${srcdir}/${srcname}"

    git apply "${srcdir}/cutelogger.patch"
    git apply "${srcdir}/melt.patch"

    qmake PREFIX='/usr/'
}

build() {
    cd "${srcdir}/${srcname}"

    make
}

package() {
    cd "${srcdir}/${srcname}"

    make INSTALL_ROOT="${pkgdir}" install

    install -D --mode=644 "${srcdir}/shotcut.desktop" "${pkgdir}/usr/share/applications/shotcut.desktop"
}
