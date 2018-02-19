# Maintainer: Daniel Ruiz de Alegria <daniruizdealegria@gmail.com>

pkgname="flat-remix-git"
pkgver=r142.5c8f2d1
pkgrel=1
pkgdesc="Flat remix is a pretty simple icon theme inspired on material design."
arch=('any')
url="https://drasite.com/flat-remix"
license=('GPL 3.0')
source=("${pkgname}::git+https://github.com/daniruiz/flat-remix.git")
sha256sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}/"
  printf "r% s.% s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}/"
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "Flat-Remix"* "${pkgdir}/usr/share/icons/"
	for theme in \
        "Flat-Remix" \
        "Flat-Remix-Dark" \
        "Flat-Remix-Light"
    do
        /bin/touch --no-create /usr/share/icons/${theme} &>/dev/null || :
        /usr/bin/gtk-update-icon-cache -q /usr/share/icons/${theme} || :
    done
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
