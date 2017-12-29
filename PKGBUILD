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
pkgver=52.5.3
pkgrel=2
pkgdesc='Standalone web browser from mozilla.org - Extended Support Release in zh_CN'
url='https://www.mozilla.org/zh-CN/firefox/channel/#esr'
arch=('x86_64')

depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'upower: Battery API'
            'speech-dispatcher: Text-to-Speech')
provides=(firefox=52 firefox-esr=$pkgver)
conflicts=('firefox-esr' 'firefox-esr-bin')
license=('MPL' 'GPL' 'LGPL')
install=$_pkgname.install

sha512sums=('adc57f98f70499a14a29cc21b42a0d7392e9f0805a6aee4d36eb6d5bf1870cd6fd380cf462043b6ce1c6b263b640e96813c53761b94ff9e6d019be8c11742584'
            '02655fae9cc4d833442b59dc53cd14d831e28c4f3adce2da37fa5123c63d75d57dccca90e4415344fb31ca01d2c3dd9b83de1b8e20e04bed9036986ee01412a6'
            '8942b11a7cb3761de1185491397185743adf49daa27a2806d14a328a2be8e2cb566c71dc6449016549cb3bd0d328cfe15944490be749a4add213194f6153c3d0')

source=(http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${pkgver}esr/linux-$CARCH/zh-CN/firefox-${pkgver}esr.tar.bz2
        $_pkgname.desktop
        $_pkgname-safe.desktop)

package() {
    cd $srcdir

    install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
    cp -r firefox/ $pkgdir/opt/$_pkgname

    ln -s /opt/$_pkgname/firefox $pkgdir/usr/bin/$_pkgname
    install -m644 $srcdir/{$_pkgname.desktop,$_pkgname-safe.desktop} $pkgdir/usr/share/applications/
    install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$_pkgname.png
}

