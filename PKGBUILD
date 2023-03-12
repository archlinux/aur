# Maintainer: Sauyon Lee <sauyon@setsuna>
pkgname=ampinstmgr
pkgver=2.4.2
pkgrel=2
epoch=
pkgdesc="AMP (Application Management Panel) is a simple to use and easy to install control panel and management system for hosting game servers."
arch=('i686' 'x86_64')
url="https://cubecoders.com/AMP"
license=(unknown)
groups=()
depends=(tmux socat dnsutils jq qrencode mono)
makedepends=()
checkdepends=()
optdepends=(jre8-openjdk-headless jre-openjdk-headless steamcmd docker)
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://repo.cubecoders.com/$pkgname-$pkgver.x86_64.tgz"
        sysusers.conf
        tmpfiles.conf
       )
sha256sums=('18005b8fb9696d746d150b58aafec7c125c6e52c8e3adcf871db7200c5b53901'
            '54478340926d4f49dd784c7cffe8e191a0b5b1dc29b72694f02b40a9672d9237'
            '5c6a673550c8243556e2c770c8e85f5892cdee334d063e49aa398175b00fce11')
noextract=()

package() {
  cd "$srcdir/"

  cp -r . "$pkgdir/"

  rm "$pkgdir/$pkgname-$pkgver.x86_64.tgz"

  # move system units to the correct place
  install -dm755 "$pkgdir/usr/lib"
  mv "$pkgdir/etc/systemd" "$pkgdir/usr/lib"

  # add amp user
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ampinstmgr.conf"
  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/ampinstmgr.conf"
}

# vim:set ts=2 sw=2 et:
