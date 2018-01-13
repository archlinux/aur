# Maintainer: chuvke <chuvke AT gmail DOT com>
pkgname=digilent-waveforms-live
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="browser app to control the OpenScopeMZ hardware"
arch=('x86_64')
url="https://reference.digilentinc.com/reference/software/waveforms-live/start"
license=('MIT')
depends=(digilent-agent xdg-utils)
makedepends=(git unzip)

source=("https://s3-us-west-2.amazonaws.com/digilent/Software/WaveForms+Live/$pkgver/waveforms-live-$pkgver.zip"        
        "https://github.com/Digilent/waveforms-live/raw/6923c91afc7bc3402b10bf56179ad1e070bee925/LICENSE"
        "waveforms-live.desktop"
	"waveforms-live")

sha256sums=('95f9a852a4b9352d42399f3ad71008eef173f488a534cd8e000f7bbd838ed5f1'
            'fbdfae05e542ea6ad7e11e3818076b46d2b6bd81dac49c59bc9ac78025ba5339'
            '74ada5e32ece8b7746f181c2dd46ecebc5017c804252b8315bb8022b062f7954'
            'e205e254ea747ca6b5aa6eb72a60d35e00006db5aa16f327aa40005e3988d397')

noextract=("waveforms-live-$pkgver.zip")

prepare() {
   unzip -Xo "waveforms-live-$pkgver.zip" -d "$srcdir" 
}

package() {
  install -dm 755 "$pkgdir/usr/share/webapps/$pkgname"
  cp -r "waveforms-live-$pkgver/." "$pkgdir/usr/share/webapps/$pkgname/"

  install -Dm 644 "waveforms-live.desktop" "${pkgdir}/usr/share/applications/waveforms-live.desktop"

  # This launch script uses xdg-open to opne the webapp in your default webbrowser
  install -Dm 755 "waveforms-live" "$pkgdir/usr/bin/waveforms-live"

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE
}


