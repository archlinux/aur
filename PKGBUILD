# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=alice-bin
pkgver=3.5
pkgrel=2
pkgdesc='An educational software that teaches students computer programming in a 3D environment'
arch=('i686' 'x86_64')
url="http://www.alice.org/"
license=('custom')
depends=('java-environment=8' 'mesa')
provides=('alice3')
install=post_install
source=("http://www.alice.org/wp-content/uploads/2019/04/Alice3_unix_3_5.sh")
noextract=('Alice3_unix_3_5.sh')
sha512sums=('8c1d17e95bc08b38a9615607be9c47dc96c0e374118364377a197e12026e6b26a0058e75a4f7d0f9c81ad1153734012a6796eaa44247c00d19c8e4a114f0c836')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	chmod 755 Alice3_unix_3_5.sh
	./Alice3_unix_3_5.sh -q -dir "$pkgdir"/opt/alice
	mv "$pkgdir/opt/alice/Alice 3.desktop" "${pkgdir}"/usr/share/applications/alice3.desktop
	rm "$pkgdir/opt/alice/uninstall"
	sed -i "s@${pkgdir}@@" "${pkgdir}/usr/share/applications/alice3.desktop"
	sed -i "6s@.*@Icon=alice3@" "${pkgdir}/usr/share/applications/alice3.desktop"
	sed -i "7s@.*@Categories=Application;Development;@" "${pkgdir}/usr/share/applications/alice3.desktop"
	sed -i "3 a Comment=An IDE for teaching kids programming" "${pkgdir}/usr/share/applications/alice3.desktop"
	install -Dm644 "${pkgdir}/opt/alice/.install4j/Alice 3.png" "${pkgdir}/usr/share/pixmaps/alice3.png"
	install -Dm644 "${pkgdir}/opt/alice/application/EULA_Alice3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: