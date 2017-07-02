# Maintainer: chuvke <chuvke AT gmail DOT com>
pkgname=digilent-waveforms-live
pkgver=1.0.6
pkgrel=1
epoch=
pkgdesc="browser app to control the OpenScopeMZ hardware"
arch=('i686' 'x86_64')
url="https://reference.digilentinc.com/reference/software/waveforms-live/start"
license=('MIT')
depends=(digilent-agent xdg-utils)
makedepends=(git unzip)

source=("https://s3-us-west-2.amazonaws.com/digilent/Software/WaveForms+Live/$pkgver/waveforms-live-$pkgver.zip"        
        "https://github.com/Digilent/waveforms-live/raw/6923c91afc7bc3402b10bf56179ad1e070bee925/LICENSE"
        "waveforms-live.desktop"
	"waveforms-live")

sha256sums=('0a1300a011afc71c6eeb4e94385299000177a147ac3e5482d3e48ea587d057ee'
            'fbdfae05e542ea6ad7e11e3818076b46d2b6bd81dac49c59bc9ac78025ba5339'
            '74ada5e32ece8b7746f181c2dd46ecebc5017c804252b8315bb8022b062f7954'
            'e205e254ea747ca6b5aa6eb72a60d35e00006db5aa16f327aa40005e3988d397')

noextract=("waveforms-live-$pkgver.zip")

prepare() {
   unzip -Xo "waveforms-live-$pkgver.zip" -d "$srcdir" 
}

package() {
  install -dm 755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -r "WFLv$pkgver/." "$pkgdir/usr/share/webapps/$pkgname/"

  install -Dm 644 "waveforms-live.desktop" "${pkgdir}/usr/share/applications/waveforms-live.desktop"

  # This launch script uses xdg-open to opne the webapp in your default webbrowser
  install -Dm 755 "waveforms-live" "$pkgdir/usr/bin/waveforms-live"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE
}
