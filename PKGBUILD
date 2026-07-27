# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=helm-unittest
_pluginname=unittest
pkgname=$_pkgname-bin
pkgver=1.1.2 # renovate: datasource=github-releases depName=helm-unittest/helm-unittest
pkgrel=1
pkgdesc="Unit test for helm chart in YAML to keep your chart functional and robust"
url="https://github.com/helm-unittest/helm-unittest"
license=('MIT')
depends=('helm')
source_x86_64=(
  "$_pkgname-$pkgver-x86_64.tgz::$url/releases/download/v$pkgver/${_pkgname}-linux-amd64-$pkgver.tgz"
)
source_aarch64=(
  "$_pkgname-$pkgver-aarch64.tgz::$url/releases/download/v$pkgver/${_pkgname}-linux-arm64-$pkgver.tgz"
)
arch=('x86_64' 'aarch64')
sha512sums_x86_64=('6f3fcf2c39b05441f279c11f10c5817c2172614b5ed882ef9e12d2877bf80c02aa4276e4344ea4588b3f8b7313a4647bcf28b93e4bfe927d97247e0d05a2c68c')
sha512sums_aarch64=('4de58deba7f427d578e7c21a082993cb8edc116f2b65204c6872198615f6f93a11fe0eca0330d1bcad35cff33ad7aa1a5f792b3d57fd5500d35c0011d901da03')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
install=$pkgname.install

package() {
  case "$CARCH" in
    x86_64)   _bin="untt-linux-amd64" ;;
    aarch64)  _bin="untt-linux-arm64" ;;
  esac
  sed -i '/^platformHooks:$/Q' "$srcdir/plugin.yaml"
  install -D -m 0755 "$srcdir/$_bin" "$pkgdir/usr/lib/helm/plugins/$_pluginname/$_bin"
  install -D -m 0644 "$srcdir/plugin.yaml" "$pkgdir/usr/lib/helm/plugins/$_pluginname/plugin.yaml"
}

#vim: syntax=sh
