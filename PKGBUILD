# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=20240926.1609
pkgrel=2
pkgdesc='Abstract strategy board game'
arch=(any)
url='https://www.tantrix.com/'
license=(unknown)
depends=(java-runtime)
makedepends=()
_base='https://www.tantrix.com/Tantrix/TGame'
source=("$_base/jws/Launcher.jar"
        "$_base/jws/OnlineLobby.jar"
        "$_base/jws/OnlineGame.jar"
        "$_base/jws/Sounds.jar"
        "$_base/jws/jzlib.jar"
        "$_base/jws/Monte.jar"
        "$_base/jws/Oliver.jar"
        "$_base/jws/Darwin.jar"
        "tantrix.png::$_base/smalltile.png"
        'tantrix'
        'tantrix.desktop'
        'tantrix-discovery.desktop'
        'tantrix-reviewer.desktop'
        'tantrix.xml'
        'GetVersion.java')
sha256sums=('231e8c7055cb4ac7d8ae8725b96eb67168aee8fb1d8a2815d39cdc5efac65a2a'
            'f4376ad456935cb48156dff8e338cbf7770a46c5946425b47294999623827b84'
            '0b63a116e33903807c46dbf74d10c5aebf3206b9c40b6472aff3001aa1ed7b1b'
            'bc173f32360111e5faf87c843506db5ca2c7229bfe008331432d776bdcc8623a'
            '9cf237e51be585fad0c7fdb7ea0a9fd6f76f9c666957a05b0375d257ab38f883'
            'c4ab12c2eb9c302a17d3321677e4c398a15eb0216fcc9a64f7dafd32e2c1717d'
            '40a8072fda037ef65cbbe350927189cc266416358ef104ab31dabfa946cc08aa'
            '0ff352cd8e7661ac9d6120622206a98a8272e81f2758032d8f1d2827d99b30b0'
            'a244a49a541adef4840c8a4e7941c79deeb02213588e7d472ed7f0fbdade01aa'
            '7aa41d4cb87bfc19f4c3f04370c7343fbb0f1e3dae6c063b66398715b77aadaf'
            'f492efa1e032bc4bd7c701e5c06c66619d23098cf1f2acafaed441ba4d8f30e0'
            '593cd009514144534b15bebe36c8e393adbfbbd63eac054eea54f20e1c362621'
            '5f8a776872a98933c5f0c7681d5cc3606b3a84290235a909d46fe2e1a1f4eb48'
            'd2cd507428f9fcc65362fc8208d39db61769b0ce09f15c33b914b3802a11b72a'
            'a3d8c2a14dd319e77b854957b6c0b053bf83682997739e1709becd4bce957968')
noextract=(*.jar)

pkgver() {
  local build
  if build="$(java -cp OnlineLobby.jar GetVersion.java 2> /dev/null)"; then
       date -d "$build" +%Y%m%d.%H%M
  else
       echo $pkgver
  fi
}

package() {
  install -Dm644 *.jar -t "$pkgdir"/usr/share/java/$pkgname
  install -Dm755 tantrix -t "$pkgdir"/usr/bin
  install -Dm644 tantrix{,-discovery,-reviewer}.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 tantrix.png -t "$pkgdir"/usr/share/pixmaps
  install -Dm644 tantrix.xml -t "$pkgdir"/usr/share/mime/packages
}
