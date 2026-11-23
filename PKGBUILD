# Maintainer: Nogweii <packages@nogweii.net>
pkgname=alpm-html
# renovate: datasource=gitlab-tags depName=archlinux/alpm-html registryUrl=https://code.aether.earth
pkgver=0.11.0
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/nogweii/alpm-html/"
license=('GPL3')
depends=('pyalpm' 'python-jinja' 'python-inflect' 'python-daiquiri')
makedepends=('asciidoc')
source=("https://code.aether.earth/nogweii/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8c59dc0c31e507ca3491ee5faf47499a6456e34c8efd424e8a4e6dbc7798d20e8f827a0469ab651ef41289127ceba60c8ec3e54a174746a68f84849a0c29f7c9')
b2sums=('e34865ca8c870f56861fa7e02e478d64475b0c3d0703300228a9c9f6c3dd050a958b0f54635349b971f353ed141c7148ab0b7b9ceed792927b982d0adf388f6c')

build() {
  cd "${srcdir}/$pkgname-v$pkgver"
  a2x -d manpage -f manpage alpm-html.1.asciidoc
}

package() {
  cd "${srcdir}/$pkgname-v$pkgver"

  install -D -m 0644 resources/* -t "${pkgdir}/usr/share/${pkgname}"
  install -D -m 0755 alpm-html.py "${pkgdir}/usr/bin/alpm-html"
  install -D -m 0644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}"
  install -D -m 0644 -t "${pkgdir}/usr/share/man/man1/" alpm-html.1
}
