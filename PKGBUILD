# Maintainer: Christophe Noisel <cnoisel at proton.me>

pkgname=sviesolutions-via-bin
# no versioning available
# use info from the download headers
# curl -vI 'https://via.sviesolutions.com/Application/Via/Via.tar.gz' 2>&1 >>/dev/null | grep 'Last-Modified'
pkgver=20220929
pkgrel=3
pkgdesc='SVI eSolutions video conferencing application'
arch=('x86_64')
url='https://assistance.sviesolutions.com'
depends=('libatomic_ops') # min version ?
source=("https://via.sviesolutions.com/Application/Via/Via.tar.gz")
sha256sums=('d3b8793636129ba69a9108fcee8b5122756b82569bc93f117ab7ad0cb93948aa')
install=$pkgname.install

package()
{
	install -m755 -d "$pkgdir/opt/sviesolutions/via"
	cp -r "${srcdir}"/via/* "$pkgdir/opt/sviesolutions/via"
	
	install -m755 -d "$pkgdir/opt/sviesolutions/viascreensharing"
	cp -r "${srcdir}"/viascreensharing/* "$pkgdir/opt/sviesolutions/viascreensharing"

	install -Dm644 "${srcdir}/via.desktop" "$pkgdir/usr/share/applications/via.desktop"
	install -Dm644 "${srcdir}/viascreensharing.desktop" "$pkgdir/usr/share/applications/viascreensharing.desktop"
}

post_install()
{
	xdg-mime default via.desktop x-scheme-handler/viaapp
	xdg-mime default viascreensharing.desktop x-scheme-handler/viascreensharing
	
	update-desktop-database -q
}

post_upgrade() {
  update-desktop-database -q
}

post_remove() {
  update-desktop-database -q
}
