# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: lucasm < luluco250 at gmail dot com >

_basename=fallout2-ce
_tag=continious
pkgname=$_basename-bin
pkgver=continuous.404236c
pkgrel=1
pkgdesc='Fallout 2 for modern operating systems'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/$_basename/$_basename"
license=('custom:SUL')
depends=('sdl2')
makedepends=('git')
options=('!debug')
source=("LICENSE-$pkgver.md::$url/raw/refs/tags/$_tag/LICENSE.md")
sha256sums=('3c260f537a0c7c3d140e5524551e5743c836cca8d819216a6934aa4669d9abec')

source_x86_64=(
    "$_basename-$pkgver::$url/releases/download/$_tag/$_basename-linux-x64"
)
sha256sums_x86_64=('SKIP')

source_i686=(
    "$_basename-$pkgver::$url/releases/download/$_tag/$_basename-linux-x86"
)
sha256sums_i686=('SKIP')

source_aarch64=(
    "$_basename-$pkgver::$url/releases/download/$_tag/$_basename-linux-arm64"
)
sha256sums_aarch64=('SKIP')

source_armv7h=(
    "$_basename-$pkgver::$url/releases/download/$_tag/$_basename-linux-armhf"
)
sha256sums_armv7h=('SKIP')

pkgver() {
    printf 'continuous.%s' "$(git ls-remote --tags "$url.git" "$_tag" | head -c 7)"
}

package() {
    install -Dm755 "$_basename-$pkgver" "$pkgdir/usr/bin/$_basename"
    install -Dm644 LICENSE-${pkgver}.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

