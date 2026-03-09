# Maintaniner: Soupy Boy <aur@bonking.im>
# Contributor: Antoine POPINEAU <antoine at popineau dot eu>

pkgname=greetd-tuigreet-soupy-boy-git
pkgver=1.0.0.r0.g20f5feb
pkgrel=0

pkgdesc='A console UI greeter for greetd'
url='https://github.com/soupy-boy/tuigreet'
license=(GPL3)
conflicts=(greetd-tuigreet greetd-tuigreet-git)

arch=(x86_64)
makedepends=(git rust scdoc)

source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd tuigreet
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd tuigreet

  cargo build --release
  scdoc < contrib/man/tuigreet-1.scd > contrib/man/tuigreet-1.roff
}

package() {
  depends=(gcc-libs)

  install -Dm755 "${srcdir}/tuigreet/target/release/tuigreet" "${pkgdir}/usr/bin/tuigreet"
  install -Dm755 "${srcdir}/tuigreet/contrib/man/tuigreet-1.roff" "${pkgdir}/usr/share/man/man1/tuigreet.1"
  install -Dm644 "${srcdir}/tuigreet/LICENSE" "${pkgdir}/usr/share/licenses/tuigreet/LICENSE"

  install -Dm644 "${srcdir}/tuigreet.conf" "${pkgdir}/usr/lib/tmpfiles.d/tuigreet.conf"
}
