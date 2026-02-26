pkgname=cohesivemail
pkgver=0.0.73
pkgrel=2
pkgdesc="CohesiveMail desktop client"
arch=("x86_64")
url="https://dl.actuallyreliable.com/apps"
license=("custom")
depends=(
  "gtk3"
  "nss"
  "libx11"
  "libxext"
  "libxrandr"
  "libxrender"
  "libxi"
  "libxfixes"
  "libxdamage"
  "libxcomposite"
  "libxcursor"
  "libxkbcommon"
  "alsa-lib"
  "mesa"
  "glib2"
  "pango"
  "at-spi2-core"
  "dbus"
)
provides=("cohesivemail")
conflicts=("cohesivemail")
source=(
  "https://dl.actuallyreliable.com/apps/cohesivemail-x86-v${pkgver}.tar.gz"
  "cohesivemail.desktop"
)
sha256sums=(
  "821e48a89a3602db152b2af882b80943e0cfe68391a4b28ad93779beee79cb21"
  "ad9c16678f1496b7e5f35558fdfe98c528841407e82988543b1eab1960457dbe"
)

package() {
  install -d "$pkgdir/opt/cohesivemail"
  local src_root=("$srcdir"/cohesivemail*)
  if [[ -d "${src_root[0]}" ]]; then
    cp -a "${src_root[0]}/." "$pkgdir/opt/cohesivemail/"
  else
    cp -a "$srcdir"/* "$pkgdir/opt/cohesivemail/"
  fi
  chmod +x "$pkgdir/opt/cohesivemail/cohesivemail"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/cohesivemail/cohesivemail "$pkgdir/usr/bin/cohesivemail"

  install -Dm644 "$srcdir/cohesivemail.desktop" "$pkgdir/usr/share/applications/cohesivemail.desktop"
}
