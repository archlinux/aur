# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Tom Richards <tom [at] tomrichards [dot] net>
# Contributor: Andreas Linz <alinz [at] klingt [dot] net>

# Comment out any feature you don't want; by default, everything is included

# Enable Cross Origin Resource Sharing
_features+=(cors)

# Deploy your site with git push.
_features+=(git)

# Powerful and easy static site generator with admin interface.
_features+=(hugo)

# Block or allow clients based on IP origin.
_features+=(ipfilter)

# Wrap regular JSON responses as JSONP
_features+=(jsonp)

# JSON webtoken middleware
_features+=(jwt)

# SMTP client with REST API and GPG support
_features+=(mailout)

# Prometheus monitoring metrics
_features+=(prometheus)

# Sets `X-Forwarded-For` header when caddy runs behind a proxy
_features+=(realip)

# Activates a site search engine
_features+=(search)

# File upload API
_features+=(upload)


pkgname=caddy-all-features
pkgver=0.8.3
pkgrel=1
pkgdesc="A configurable, general-purpose HTTP/2 web server for any platform (All features enabled)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://caddyserver.com"
license=('Apache')
install='caddy.install'
provides=('caddy')
conflicts=('caddy' 'caddy-git')

source=('caddy.service')
sha256sums=('244fa03febae623f1b10adfb6883a9573ba81747b8e535bb23101ab230ccbf95')

printf -v _features '%s,' "${_features[@]}"
_features=${_features%,}
_url_prefix="https://caddyserver.com/download/build?os=linux&features=${_features}"

source_i686=("caddy.tar.gz::${_url_prefix}&arch=386")
sha256sums_i686=('SKIP')

source_x86_64=("caddy.tar.gz::${_url_prefix}&arch=amd64")
sha256sums_x86_64=('SKIP')

source_armv6h=("caddy.tar.gz::${_url_prefix}&arch=arm")
sha256sums_armv6h=('SKIP')

package() {
  install -Dm755 "$srcdir/caddy" "$pkgdir/usr/bin/caddy"
  install -Dm644 "${srcdir}/caddy.service" "${pkgdir}/usr/lib/systemd/system/caddy.service"
}
