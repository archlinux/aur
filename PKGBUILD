# Maintainer: Nogweii <packages@nogweii.net>
pkgname=alpm-html
# renovate: datasource=gitlab-tags depName=archlinux/alpm-html registryUrl=https://code.aether.earth
pkgver=0.10.0
pkgrel=1
pkgdesc="Generate a static site for browsing an Arch repo, styled like the main website."
arch=(any)
url="https://code.aether.earth/nogweii/alpm-html/"
license=('GPL3')
depends=('pyalpm' 'python-jinja' 'python-inflect' 'python-daiquiri')
makedepends=('asciidoc')
source=("https://code.aether.earth/nogweii/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('3361c8030b578206983b26c3858afaf55c7103574c59bb5eeea0a6a5e2289ae6d24124399a3ab69ee7f09eb92800a5802274976da35560cd41f407fdf560073e')
b2sums=('2a801232c0ebadb7b9b5862ce30dcedeff62a9a2f8b6081238ab0c990fde75626c31e68b9e709ffad90db7086b016d7190d36667a684eaa308b2a5e05d7597a2')

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
