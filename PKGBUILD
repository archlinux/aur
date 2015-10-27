_cfgdir=/opt/openresty/nginx/conf
_tmpdir=/var/lib/openresty
pkgname=openresty-lua-cookie
pkgver=20151001.23.8b9e467
url=("https://github.com/cloudflare/lua-resty-cookie")
license=('BSD')
arch=(any)
sha512sums=( SKIP )
depends=( openresty )

source=( "$pkgname::git+https://github.com/cloudflare/lua-resty-cookie" )
pkgrel=1

pkgver() {
  local -a log_args=( -n 1 --date-order --format='%at' )
  [[ $release ]] || release=$(date -d "@$(cd "$srcdir/$pkgname" && exec git log "${log_args[@]}")" +%Y%m%d)
  # Use the tag of the last commit
  local cnt="$(cd "$srcdir/$pkgname" && exec git rev-list --count HEAD)"
  local ver="$(cd "$srcdir/$pkgname" && exec git rev-parse --short HEAD)"
  printf "%s.%s.%s" "$release" "$cnt" "${ver//-/.}"
}

build() { :; }
package() {
  mkdir -p "$pkgdir/opt/openresty/lualib/resty"
  cp -a "$srcdir/$pkgname/lib/." "$pkgdir/opt/openresty/lualib/"
}

# vim:set ts=2 sw=2 et:
