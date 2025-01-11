# Maintainer: yifwon <wyf9661@gmail.com>

pkgname=fetch-github-hosts-git
pkgver=2.8.r58.16630c
pkgrel=1
pkgdesc='Synchronize GitHub hosts tool, support multi-platform graphical and command line, built-in client and server modes.'
arch=(any)
url='https://github.com/Licoy/fetch-github-hosts'
license=(MIT)
provides=("${pkgname%-git}")
source=(git+${url}.git
        "${pkgname%-git}-server.service"
        "${pkgname%-git}-client.service")
sha1sums=('SKIP'
          'dc25f40b181a13edd23d19200350390c18e95b1a'
          'a436c7ec95713ac811564e1b590e1e5e628c772f')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" \
    "$(awk -F'=' '/Version/{print $2}' FyneApp.toml | tr -d '[:space:]' | sed 's/"//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=6 HEAD)"
}

build() {
  cd "${pkgname%-git}"
  go build
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 ${pkgname%-git} -t "${pkgdir}/usr/bin/"
  install -Dm644 ${srcdir}/${pkgname%-git}-server.service  ${pkgdir}/usr/lib/systemd/system/${pkgname%-git}-server.service
  install -Dm644 ${srcdir}/${pkgname%-git}-client.service  ${pkgdir}/usr/lib/systemd/system/${pkgname%-git}-client.service
}
