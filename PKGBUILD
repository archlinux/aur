# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=istio-bin
_pkgname=istio
pkgver=1.15.0
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

sha256sums_x86_64=('5d84897dc25be6757568ef50bb3ddf86388456768cd658ed2670a4f12803c3f8')
sha256sums_armv7h=('a0933aa68122188d92fca65f2c0efe00853ce4c6954b5a39449d0d671eb26f27')
sha256sums_aarch64=('1f56175c1a9509357326f254a80061ea9b3582c91a9f4b594c029c7531a160cb')

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
