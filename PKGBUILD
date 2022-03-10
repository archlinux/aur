# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=istio-bin
_pkgname=istio
pkgver=1.13.2
pkgrel=1
pkgdesc='An open platform to connect, manage, and secure microservices'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://istio.io'
license=('Apache')
depends=('bash' 'glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

_source_base="https://github.com/istio/istio/releases/download/$pkgver"

source_x86_64=("$_source_base/istio-$pkgver-linux-amd64.tar.gz")
source_armv7h=("$_source_base/istio-$pkgver-linux-armv7.tar.gz")
source_aarch64=("$_source_base/istio-$pkgver-linux-arm64.tar.gz")

sha256sums_x86_64=('a1c30fe5c612fce80a19fe3d221ddac43f8fc6395e0f18d12bd34320f059dea7')
sha256sums_armv7h=('7fcbc2514c9cad3756557bb49015707f9ede72478980aa79ddaf22090d507929')
sha256sums_aarch64=('5ec5fd654a48189ee4738d18548002240e2e1c98afd477bdf48819b49354a25f')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  install -Dm755 "bin/istioctl" "$pkgdir/usr/bin/istioctl"
  install -Dm644 "tools/_istioctl" "$pkgdir/usr/share/zsh/site-functions/_istioctl"
  install -Dm644 "tools/istioctl.bash" "$pkgdir/usr/share/bash-completion/completions/istioctl"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -d "$pkgdir/usr/share/$_pkgname"
  for d in manifests samples tools; do
    cp -R "$d" "$pkgdir/usr/share/$_pkgname/"
  done
}
