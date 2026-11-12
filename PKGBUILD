# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=20261106.1011
pkgrel=1
pkgdesc='Abstract strategy board game'
arch=(any)
url='https://www.tantrix.com/'
license=(unknown)
depends=(java-runtime)
makedepends=()
_base='https://www.tantrix.com/Tantrix/TGame'
source=("Launcher.$pkgver.jar::$_base/jws/Launcher.jar"
        "OnlineLobby.$pkgver.jar::$_base/jws/OnlineLobby.jar"
        "OnlineGame.$pkgver.jar::$_base/jws/OnlineGame.jar"
        "Sounds.$pkgver.jar::$_base/jws/Sounds.jar"
        "jzlib.$pkgver.jar::$_base/jws/jzlib.jar"
        "Monte.$pkgver.jar::$_base/jws/Monte.jar"
        "Oliver.$pkgver.jar::$_base/jws/Oliver.jar"
        "Darwin.$pkgver.jar::$_base/jws/Darwin.jar"
        "tantrix.png::$_base/smalltile.png"
        'tantrix'
        'tantrix.desktop'
        'tantrix-discovery.desktop'
        'tantrix-reviewer.desktop'
        'tantrix.xml'
        'GetVersion.java')
sha256sums=('5020389e287c7cecb6f330b26b7aa329ce1bc17e9451983a68371de3ec106fab'
            '3356748939c98b7e4551f7e82d1fb10a39acdc12a1ac0dab4c28f4c49da754c9'
            '8af138bf2a513db5420c6a2344568fcdf0a122ad7a00cf7ada6dea5a8bc8e319'
            '2fb30637b479d0a064e8ab3ce066f61773b8227b739fcda7272505bc898c3cfc'
            '254450a4abe19837d04085f7de80ebc21f11f36c35991c97a4366fc84f59d84b'
            '91ce991d235f822c65271007e4e69887eacf56ff39ed51c12ee81442418aff4d'
            'f38afe6f33f31cde9256347dfaf23402e73ffcc31c1a7da08ab6083b574bae78'
            'a1610e2e4747d780fcdfeaa294f6f86ea6be70b6eec6912b436cdb0554d7bf76'
            'a244a49a541adef4840c8a4e7941c79deeb02213588e7d472ed7f0fbdade01aa'
            '7aa41d4cb87bfc19f4c3f04370c7343fbb0f1e3dae6c063b66398715b77aadaf'
            'f492efa1e032bc4bd7c701e5c06c66619d23098cf1f2acafaed441ba4d8f30e0'
            '593cd009514144534b15bebe36c8e393adbfbbd63eac054eea54f20e1c362621'
            '5f8a776872a98933c5f0c7681d5cc3606b3a84290235a909d46fe2e1a1f4eb48'
            '2b0bea34e3fe8fabff48a913952f4112f96f11e359ec93327ca3a15bc32cfaf1'
            'a3d8c2a14dd319e77b854957b6c0b053bf83682997739e1709becd4bce957968')
noextract=("Launcher.$pkgver.jar" "OnlineLobby.$pkgver.jar" "OnlineGame.$pkgver.jar" "Sounds.$pkgver.jar"
  "jzlib.$pkgver.jar" "Monte.$pkgver.jar" "Oliver.$pkgver.jar" "Darwin.$pkgver.jar")
options=(!debug)

prepare() {
  for f in *.$pkgver.jar; do
    mv $f ${f/%$pkgver.jar/jar}
  done
}

pkgver() {
  local build
  if build="$(java -cp OnlineLobby.jar GetVersion.java 2>/dev/null)"; then
    date -d "$build" +%Y%m%d.%H%M
  else
    echo "Current java doesn't support running from source code, not updating pkgver. Change your java environment using archlinux-java in order to update the package version." >&2
    echo $pkgver
  fi
}

package() {
  install -vDm644 *.jar -t "$pkgdir"/usr/share/java/$pkgname
  install -vDm755 tantrix -t "$pkgdir"/usr/bin
  install -vDm644 tantrix{,-discovery,-reviewer}.desktop -t "$pkgdir"/usr/share/applications
  install -vDm644 tantrix.png -t "$pkgdir"/usr/share/pixmaps
  install -vDm644 tantrix.xml -t "$pkgdir"/usr/share/mime/packages
}
