# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname='ssh2incus-bin'
pkgver=0.8
pkgrel=1
pkgdesc="SSH server for Incus instances"
arch=(
  'x86_64'
  'aarch64'
)
url='https://ssh2incus.com/'
license=('GPL-3.0-only')
depends=()
optdepends=('incus')

backup=('etc/default/ssh2incus')
install=ssh2incus.install
conflicts=('ssh2incus')

source=(
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/ssh2incus.service"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/ssh2incus.env"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/config.yaml"
  "https://raw.githubusercontent.com/mobydeck/ssh2incus/refs/tags/${pkgver}/packaging/create-config.yaml"
)
sha256sums=('73cfa1a56765ec898e5a6803bca33357179b3d447e325baf9c6a0b9621a1c804'
            '714c117e53609ce0047af745f143078fa97c7d262d6511fd659b377b5c226fa9'
            '206688edb2bbc6fdc6236a66c26cf81c7b2595d0732cfcae3d9db096591f8128'
            'dd9289ec3f8721e95fdecaf71a5873664decd8018e616916d8f3abea38e3a9ed')
source_x86_64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-amd64.tar.gz"
)
sha256sums_x86_64=('abd3e5c3516704cccf1873bb97211dff38640de011a87ba1942a3a15cb956914')
source_aarch64=(
  "https://github.com/mobydeck/ssh2incus/releases/download/${pkgver}/ssh2incus-${pkgver}-linux-arm64.tar.gz"
)
sha256sums_aarch64=('b0021dc2d237b7629a761e0d053a0009d73e6ada102438f715ec6795d02f1131')

package() {
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-amd64" "$pkgdir/usr/bin/ssh2incus"
  elif [[ "$CARCH" = "aarch64" ]]; then
    install -Dm755 "$srcdir/ssh2incus-linux-arm64" "$pkgdir/usr/bin/ssh2incus"
  fi

  install -Dm644 "$srcdir/ssh2incus.env" "$pkgdir/etc/default/ssh2incus"
  install -Dm644 "$srcdir/config.yaml" "$pkgdir/etc/ssh2incus/config.yaml"
  install -Dm644 "$srcdir/create-config.yaml" "$pkgdir/etc/ssh2incus/create-config.yaml"
  install -Dm644 "$srcdir/ssh2incus.service" "$pkgdir/usr/lib/systemd/system/ssh2incus.service"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/ssh2incus/README.md"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/ssh2incus/LICENSE"
}