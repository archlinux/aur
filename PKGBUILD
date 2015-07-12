# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

# NOTICE: This needs Steinberg VST Audio Plug-Ins SDK in ~/SDKs to work.
# It can obtained like this:
# 1. curl -LO http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip
# 2. unzip vstsdk360_22_11_2013_build_100.zip
# 3. mkdir -p ~/SDKs/vstsdk2.4
# 4. cp -va "VST3 SDK/." ~/SDKs/vstsdk2.4

pkgname=radium
pkgver=3.1.4
pkgrel=1
pkgdesc="A graphical music editor. A next generation tracker."
arch=('i686' 'x86_64')
url="http://users.notam02.no/~kjetism/radium/"
license=('GPL')
depends=(
    'python2'
    'libxaw'
    'libsndfile'
    'libsamplerate'
    'liblrdf'
    'qt4'
    'libxkbfile'
    'glu'
    'speex'
    'fftw'
    'jack'
    'libxinerama'
    'libxcursor'
)
makedepends=(
    'cmake'
)
options=(!strip)
source=("https://github.com/kmatheussen/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('0bb481835ebdc14c542839e4e66dc22b')

build() {
    cd "${pkgname}-${pkgver}"
    make packages
    BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
    cd "${pkgname}-${pkgver}"

    # Remove objects created during packages compilation.
    rm -rf "bin/packages"

    mkdir -p "${pkgdir}/opt/radium"
    mkdir -p "${pkgdir}/usr/bin"
    cp -va "bin/." "${pkgdir}/opt/radium/"
    ln -s "${pkgdir}/opt/radium/radium" "${pkgdir}/usr/bin/radium"
}

# vim:set ts=4 sw=4 et:
