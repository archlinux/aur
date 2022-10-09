# Maintainer: filips <projects at filips dot si>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa-bin/PKGBUILD

pkgname="firefox-pwa-bin"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="2.1.1"
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
sha256sums_x86_64=('19b2f3a964cbf90c1d2b599a780c721b1a0560e1b2ea7f3cadfb469c57d88c41')
sha256sums_i686=('8da1598ec08c421daaad1a04cf30be7dfc89b267125b45e1f239fb7b6436ab5f')
b2sums_x86_64=('d78b22aecf8317dba1f2292664715b3c24ca324a4122698590d9d992e64776f0270765a96f9cbcc125479f9752a585a9206e97ffc32757c02a7cd89461393fc6')
b2sums_i686=('e5b6cf474fdb0618986239af41f91fea91d464522b4a0e0d038f1f486ffc927588da9d55285c43571410ea95280873922ea30d1b841d53a76c8f6d63818800f3')

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
