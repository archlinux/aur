# Maintainer: Allen Zhong <moeallenz AT gmail DOT com>
# Previous Maintainer: halflife <pigoig_At_gmail_com>
# Contributor: Manuel Kauschinger <admin at bruzzzla dot de>
# Contributor: Will Adams <info at clementlumber dot com>
# Contributor: T. Jameson Little <t.jameson.little at gmail dot com>
# Contributor: Stephen Michael <ihateseptictanks at gmail dot com>
# Contributor: Simon Tunnat <simon+aur@tunn.at>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=firefox-esr-zh-cn
_pkgname=firefox-esr
pkgver=52.3.0
pkgrel=1
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release in zh_CN'
url='https://www.mozilla.org/zh-CN/firefox/channel/#esr'
arch=('i686' 'x86_64')

depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'upower: Battery API'
            'speech-dispatcher: Text-to-Speech')
provides=('firefox=52')
conflicts=('firefox-esr' 'firefox-esr-bin')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('c9e2b151600509ddbbb48dcadb7c68a0a9eabc5c6468797e7658c309f63def643d33336790c26301fc799f5fde161591b336f926ed4f7a365180be87b9016054'
            '64f9f5549328a699aeba3edc78cbcb2fa465b0319945b0e3b7c8d8cd0459c3bf3d583d168c1e99085a0b06a8ab92faa8398010ca020aaa4b98faa7e4051bc852'
            '02655fae9cc4d833442b59dc53cd14d831e28c4f3adce2da37fa5123c63d75d57dccca90e4415344fb31ca01d2c3dd9b83de1b8e20e04bed9036986ee01412a6'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')
[[ "$CARCH" == "i686" ]] && sha512sums[0]='6bafc1a8a691dd8c81b2438be26d4efc4dc9cb61302866b471fb7eddc321bfb23950b3e09cc078f8a831cf02b7a7e6516440deb2fec49533e63f32638cf896c4'

# if [[ -n "$FIREFOX_ESR_BIN_PREFER_OLDER" ]]; then
    # pkgver=38.8.0
    # provides=('firefox=38')
    # sha512sums[0]='644dec9233a30b8929e8eb38aecab6f78be234c08c62fa038f7c8f5b8bdfed50ba053a402f92747e730147107d6e3408a21641de93792d35dc87967017065c90'
    # [[ "$CARCH" == "i686" ]] && sha512sums[0]='25bd1f1be5c62b3b5acfae25bfefdb87ea20594730f1dec43ddec4af3d56b1b5b586c78f28595cda9c15904eb8d0b4806c312337d48d872361769a4fc81e3df3'
# fi
source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-$CARCH/zh-CN/firefox-${pkgver}esr.tar.bz2
        vendor.js
        $_pkgname.desktop
        $_pkgname-safe.desktop)

package() {
    cd $srcdir

    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    install -Dm644 ../vendor.js "$pkgdir/opt/$_pkgname/browser/defaults/preferences/vendor.js"
    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}

