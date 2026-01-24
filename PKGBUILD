# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=20260115.1501
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
sha256sums=('8cc8d3581008460c3025494038b9361514246894c0bc2e94c932fc2729898245'
            '7202f7ea762786800793a2fe8d2952457c1f40451ddeef63ad1dffbe01bc2239'
            'cb933a9d79884e0d94f6f414ef24d8bc76e47ef289c4e7144ba29d90d6a647a5'
            '7df897e8ea2c73f9e94a43d0d84f0fe61098c94400a3500789d7f6f85aa8221f'
            'bdbac0a7b065dc36f4d7712effab9c1becff4f67f8733a1ba4496c719dc8b065'
            '0e7ec46a7129851f32e4f4d08b45d33e09fd65e26aab1cd9f6c6774eb591912a'
            '442c2279a1286375457b48b7988d53ba31bddd0e5d01e0f724ebea139e0a3b29'
            '658fb765a0e41a1b4cc4fbf7899f6e468206964d4a89ac188ca4c2116df1ca25'
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
