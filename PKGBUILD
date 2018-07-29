# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0+dev1+91+ga5704df
_commit=a5704df93e652b7ca461b5ec33b442c23d929eaa
pkgrel=2
pkgdesc='SSH-alike that uses the Noise protocol'
arch=(i686 x86_64)
url=https://github.com/oxy-secure/oxy
license=(BSD)
makedepends=(git rust-nightly)
conflicts=(oxy-git)
source=(git+$url#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo +nightly build --release --locked
}

check() {
  cd oxy
  cargo +nightly test --release --locked || true
}

package() {
  cd oxy
  install -D target/release/oxy "$pkgdir"/usr/bin/oxy
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/oxy/LICENSE
}
