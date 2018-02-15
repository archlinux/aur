# Maintainer: Alice Jenkinson <virtual.aur at zero-x dot nz>
_pkgname=katawa-shoujo
pkgname=$_pkgname-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="A bishoujo-style visual novel by Four Leaf Studios (uses bundled Ren'Py)"
arch=("x86_64")
url="http://www.katawa-shoujo.com"
license=("CCPL:BY-NC-ND")
conflicts=("${_pkgname}")
options=("!strip")

source=(
  "[4ls]_katawa_shoujo_${pkgver}-[linux-x86][18161880].tar.bz2::http://dl.katawa-shoujo.com/gold_${pkgver}/%5b4ls%5d_katawa_shoujo_${pkgver}-%5blinux-x86%5d%5b18161880%5d.tar.bz2"
  "katawa-shoujo"
  "katawa-shoujo.png"
  "katawa-shoujo.desktop"
)

package() {
	cd "${srcdir}/Katawa Shoujo-${pkgver}-linux"

	install -d -m755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r game renpy "Katawa Shoujo.py" "${pkgdir}/usr/share/${_pkgname}"
	install -d -m755 "${pkgdir}/usr/share/${_pkgname}/lib"
	cp -r lib/linux-x86_64 lib/pythonlib2.7 "${pkgdir}/usr/share/${_pkgname}/lib"

	# start script
	install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# icon / desktop file
	install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# license
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# manual
	install -D -m644 'Game Manual.pdf' "${pkgdir}/usr/share/doc/${pkgname}/gamemanual.pdf"
}

sha512sums=(
  "d5f1b49c60b70b272dd5d62c1d49cb9e3c17e3f77339fc593db2122f1c140005bc23ecb7ad9b0d93c0701c77f9bcfcd5c1c67db1cbe3034a3be42a4309387809"
  "c3e6a316b8b6d96cb7f19d435e7210faf4bd4c23b0a8c97182f7d12916899722402c432dbe067092689d780397e1bd05da744b163e9ce61f6caa8fac7fce86f8"
  "109f149c3e183be87ce50b21941bf3551e00859bb59ae3372625757418ed29d897db1a362e83eeac7cb3e8ec2c15386ef4bfe9373eb5ad013cd02df905bc8e80"
  "296dd5748bb89ee8f4ffe16005bdddd5a2babfae5910bce76dd214f5f48b8ecbb920583d54cbbc458a086cd21d0f71ce927c5b17c10a193396ae40b45a412fd9"
)
