# Maintainer: Filth <filth [at] wagn [dot] me>

_pkgname=echo-vn
pkgname="${_pkgname}-bin"
pkgver=1.01
pkgrel=1
pkgdesc="A horror visual novel about a small, isolated, desert town located somewhere in the southwestern states. (bundled Ren'Py)"
arch=('x86_64' 'i686')
options=("!strip" "!debug")
url="https://echoproject.itch.io/echo"
depends=('bash')
makedepends=('itchio-dlagent')
license=('custom')
source=("$_pkgname.desktop"
        "$_pkgname.sh"
        "Echo-$pkgver-linux.tar.bz2::itch://echoproject/echo/5524813")
b2sums=('0ae6f4fa7c49f6078593857e4826d79443e710090fb49617f488a2a4dabb94f137febb586f4e66950dade896d6eb39e82948aab721513fbb3d9236c4abd78a32'
        'a04b87d368e017001ed0ce75b70bab3482539b167110c835b2b15398119da5d29107ae9971d2ccd1798b6117eca253215a9c50d8df7a79ef58c4f893ae712718'
        'aa806e99ed4cf3d62a183d17bd910917d842ec0d8fa453f163ef14054898c12f969cb3cb8b464387517463ce5c30853157b26af337a2f6722988f6539a905c0f')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
  # Remove unnecessary files
  rm -rf "Echo-$pkgver-linux/Echo.exe"
  if [[ "$CARCH" == "x86_64" ]]; then
    rm -rf "Echo-$pkgver-linux/lib/linux-i686"
  elif [[ "$CARCH" == "i686" ]]; then
    rm -rf "Echo-$pkgver-linux/lib/linux-x86_64"
  fi

  # Install Data
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -r Echo-$pkgver-linux/* "$pkgdir/usr/share/$_pkgname"

  # Install Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  # Install Desktop
  install -Dm644 "Echo-$pkgver-linux/game/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}