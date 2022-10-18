# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.1.2"
pkgrel=1
url="https://github.com/filips123/PWAsForFirefox"
arch=("x86_64" "i686")
license=("MPL2")

depends=("glibc>=2.18")
optdepends=("firefox: Support for browser extension")
provides=("firefox-pwa")
conflicts=("firefox-pwa")
install=package.install

source_x86_64=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_amd64.deb")
source_i686=("https://github.com/filips123/PWAsForFirefox/releases/download/v${pkgver}/firefoxpwa_${pkgver}_i386.deb")
sha256sums_x86_64=('34d9a22c7a8bc1619cebba87ea100fb0bbe526afb755b5eb9e5135a532a063e3')
sha256sums_i686=('6ddd333a7303a36d757f8cb1f9df4572d1e98871f94baed5194e682e3911bb2a')
b2sums_x86_64=('62a7183515bc7af161dd96bd7fdfa6fe4c25216cc6d2ce12986f2c3894e50a343bfde41f1b02a65dfe2eb097cdf5fe12958445fa3c53dfeec8974a4764b46b1a')
b2sums_i686=('6f0f7dd809e8d7d630b9ef935648fcabf774267b38ebd454a97c591505318ddec5fcd627636c2de06642d0196a44649ad492d2b5b1e08a04e62e1659610f6c5e')

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
