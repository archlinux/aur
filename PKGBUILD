# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=tantrix
pkgver=20260610.0806
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
sha256sums=('c0343330df5c04d46aa4532f6d7f93ba9f9f0e7d6ad76660cc4a33660994d703'
            '8dda1c5b647ba184fe78341d12b7e97296ee089fda4dd4e061364995203521d2'
            'a471d4fd0d2264d9526c23d8fe809d037ca46fc9d4a0a9e26845fd9fa80e3a65'
            '6765c677d2832cde27a15a221ccd322e5be5ca49d774b31452f3908f0e912d07'
            '59ef7f848838827b965dfd16854f6456327c7cbb3d9d2f7d2679c933c9d264d5'
            '77a95d761a7b3ec99bd5c129b37d92a5cc5845019aa36ea8d73fa1c544f7f576'
            'c466784ab1f082d4b361202273a4aca9978b02fa4224562c1bc4b1fb681b39ec'
            '3da6020dcb7317b14a18815d914d05a8fafb185c22be939703003d7840ed6099'
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
