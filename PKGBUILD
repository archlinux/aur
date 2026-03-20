# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=ai-robots-txt-git
pkgver=1.45.r2.g86d582b
pkgrel=1
pkgdesc='List of AI crawler user agents. (git version)'
arch=(any)
url="https://github.com/ai-robots-txt/ai.robots.txt"
license=('MIT')
optdepends=('nginx: nginx blocker config'
            'haproxy: haproxy blocker config'
            'apache: htaccess blocker config'
            'caddy: caddy blocker config')
provides=('ai-robots-txt')
conflicts=('ai-robots-txt')
source=("git+https://github.com/ai-robots-txt/ai.robots.txt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/"ai.robots.txt
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  install -m644 -D "$srcdir"/ai.robots.txt/robots.txt -T "$pkgdir"/usr/share/ai-robots-txt/robots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/robots.json -T "$pkgdir"/usr/share/ai-robots-txt/robots.json
  install -m644 -D "$srcdir"/ai.robots.txt/nginx-block-ai-bots.conf -T "$pkgdir"/usr/share/ai-robots-txt/nginx-block-ai-bots.conf
  install -m644 -D "$srcdir"/ai.robots.txt/haproxy-block-ai-bots.txt -T "$pkgdir"/usr/share/ai-robots-txt/haproxy-block-ai-bots.txt
  install -m644 -D "$srcdir"/ai.robots.txt/.htaccess -T "$pkgdir"/usr/share/ai-robots-txt/htaccess
  install -m644 -D "$srcdir"/ai.robots.txt/Caddyfile -T "$pkgdir"/usr/share/ai-robots-txt/Caddyfile
  install -m644 -D "$srcdir"/ai.robots.txt/LICENSE -T "$pkgdir"/usr/share/licenses/ai.robots.txt/LICENSE
}
