pkgname=android-cli
pkgver=1.0.15857036
pkgrel=1
pkgdesc='Google Android CLI prebuilt binary'
arch=('x86_64')
url='https://developer.android.com/tools/agents/android-cli'
license=('LicenseRef-Android-SDK')
depends=('glibc')
options=('!strip' '!debug')

source_x86_64=(
  "android-cli-$pkgver-x86_64::https://dl.google.com/android/cli/$pkgver/linux_x86_64/android-cli"
  'LICENSE'
)
sha256sums_x86_64=(
  'e5b6930e96a1e898a69f0194c68f5867bc83fa86dde87ab733ab5493d0c8e7c2'
  '65c32078048f3fdb0ab70bd7d287d78c45a0d8e20a71b23b7ac1bf5e2e87729e'
)

check() {
  local tmp_home out
  chmod +x "$srcdir/android-cli-$pkgver-x86_64"
  tmp_home="$(mktemp -d)"
  out="$(HOME="$tmp_home" "$srcdir/android-cli-$pkgver-x86_64" --version 2>&1)"
  rm -rf "$tmp_home"

  grep -Fqx "$pkgver" <<<"$out"
  ! grep -Fq 'Downloading Android CLI...' <<<"$out"
}

package() {
  install -Dm755 "$srcdir/android-cli-$pkgver-x86_64" "$pkgdir/usr/bin/android"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
