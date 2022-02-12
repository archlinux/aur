# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Jean-Francois Chevrette <jfchevrette@gmail.com>
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=istio-bin
_pkgname=istio
pkgver=1.13.0
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

sha256sums_x86_64=('3c29932359141e14a00fa521ee00139d7bf5dea17bafbcbfdc969a4fe157402a')
sha256sums_armv7h=('a9b24874a5b5986ff66e3fc926e63711dc14354b760a380f31f780afd1235669')
sha256sums_aarch64=('62514a75fb9631c29030377dba8c1fea5a13bdca063ec9ec70d01699336154f9')

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
