# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.12.2"
pkgrel=1
url="https://pwasforfirefox.filips.si/"
arch=("x86_64" "i686" "aarch64" "armv7h")
license=("MPL2")

depends=("glibc>=2.18")
optdepends=("firefox: Support for browser extension")
provides=("firefox-pwa")
conflicts=("firefox-pwa")
install=package.install

source_x86_64=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_amd64.deb")
source_i686=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_i386.deb")
source_aarch64=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_armhf.deb")
b2sums_x86_64=('4a0c9682107dc4fa0bec3778e4269d81218ebe5b8bd79ee0be4426b4bb147bb733c1570955e69bf246fd997ac1cede7405434951aa1c7c6f3be1833c259c7e36')
b2sums_i686=('0d7ec575ce9fdc2c239bcd43f8643ea656b5597a7be3beaf21086404847f2d505594964294017de11ed1e2960d06a98754601f8d77c42f14603f95cd05b62f6e')
b2sums_aarch64=('c80443a00f64345c89a542fefe95ddb1c2f20f7d385bbb4de90f8060608cba84455bf185f8236221daaa06a073918c143b7fd1700709371fac832180b2f538f9')
b2sums_armv7h=('ca5aeb1e2aea5678263d56ad934d32648279d8894e5b44ab5c4e44106f1a7a31eca25cf2fa6a34ec7343d8dfe6ed4ec227800148cefc29909c194bb9d357b38e')

prepare() {
    # Extract data from DEB archive
    mkdir -p $srcdir/data/
    tar xf ${srcdir}/data.tar.xz -C $srcdir/data/

    # We don't use libexec on Arch
    sed -i "s@/usr/libexec/firefoxpwa-connector@/usr/lib/firefoxpwa/firefoxpwa-connector@g" $srcdir/data/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json
    mkdir -p $srcdir/data/usr/lib/firefoxpwa/
    mv $srcdir/data/usr/libexec/firefoxpwa-connector $srcdir/data/usr/lib/firefoxpwa/

    # Remove unnecessary directories
    rm -rf $srcdir/data/usr/libexec/
    rm -rf $srcdir/data/usr/lib64/
}

check() {
    cd $srcdir/data/
    [ "$(./usr/bin/firefoxpwa --version)" == "firefoxpwa $pkgver" ]
}

package() {
    cp -r $srcdir/data/* $pkgdir
}
