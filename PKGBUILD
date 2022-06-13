# Maintainer: Philipp Hentschel  <aur[at]f1ndus[dot]de>

pkgname=apnotes
pkgver=0.4.1
pkgrel=1
pkgdesc='Interface for Linux to View, Edit, Create and Sync Notes written on apple devices'
url='https://github.com/findus/apnotes'
arch=('x86_64')
license=('MIT')
makedepends=('rust' 'scdoc')
depends=('sqlite' 'openssl' 'dbus')
source=(https://github.com/findus/apple-notes-bridge/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ac67711c97e259891f07660fe0761d53b59df8fdbb471a8db49e76687065e0fe')
sha512sums=('e44969a7ac274ac425e2196593fd140757df96a899fa82d6cac5bd35b1276054b8e8474e86d438e07f8a35862db305b3a7adf8746c6dc4b3412b3106d6a2d423')
validpgpkeys=('01938725ABC3812F5DBC219C6E19B9E46E818A5F')


build() {
  cd ${pkgname}-${pkgver}
  SHELL_COMPLETIONS_DIR=completions cargo build --release --locked
}

check() {
  cd ${pkgname}-${pkgver}
  cargo test --release --locked -- --test-threads=1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  echo $(pwd)
  install -Dm755 target/release/apnotes-tui -t "${pkgdir}/usr/bin"
  install -Dm755 target/release/apnotes -t "${pkgdir}/usr/bin"
  install -Dm644 target/release/apnotes.1.gz -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 target/release/apnotes.5.gz -t "${pkgdir}/usr/share/man/man5"
  install -Dm644 target/release/apnotes-tui.1.gz -t "${pkgdir}/usr/share/man/man1"
}
