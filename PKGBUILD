# Maintainer: Abraham Toriz <categulario at gmail dot com>
# Maintainer: kedap <kedap at protonmail dot com>
pkgname=tiempo
_reponame=tiempo-rs
pkgver=1.4.1
pkgrel=1
pkgdesc="A command line time tracker application"
arch=('i686' 'x86_64')
url="https://gitlab.com/categulario/tiempo-rs"
license=('GPL3')
depends=()
optdepends=('sqlite: for manually editing the database')
makedepends=('cargo' 'git' 'python-sphinx')
provides=('tiempo')
conflicts=('tiempo-git' 'tiempo-bin')
source=("https://gitlab.com/categulario/$_reponame/-/archive/v$pkgver/$pkgname-rs-v$pkgver.tar.gz")
sha256sums=('ed5a5e2f01f3cd67ed0681110628b8bef8f437f14828979f3533526a5559e921')

build() {
  cd "$_reponame-v$pkgver"
  cargo build --release --locked

  # Generating man pages, en and es
  cd docs/en
  make man
  cd ../es
  make man
}

package() {
  cd "$_reponame-v$pkgver"
  install -Dm755 target/release/t "${pkgdir}"/usr/bin/t
  install -Dm644 completions/bash/tiempo-autocomplete.bash "${pkgdir}/usr/share/bash-completion/completions/tiempo.bash"
  install -Dm644 docs/en/build/man/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 docs/es/build/man/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}-es.1"
}
