# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=c43
pkgbase=c47-bin
pkgname=(c47-bin r47-bin)
pkgver=00.109.03.02b0
pkgrel=1
pkgdesc="Emulator for the C47 pocket calculator"
arch=('x86_64')
url="https://47calc.com"
license=('GPL-3.0-or-later')
depends=('glibc' 'cairo' 'gtk3' 'libpulse' 'bash' 'glib2' 'gmp' 'hicolor-icon-theme')
makedepends=('icoutils' 'gendesk')
checkdepends=()
optdepends=()
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("https://gitlab.com/api/v4/projects/14055190/packages/generic/${pkgname::-4}/${pkgver}/${pkgname::-4}-linux-${pkgver}.zip"
	"https://gitlab.com/rpncalculators/c43/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=('b90943ba3258ecf186d3ff6cc1a3be143b56300b627d089f49ec4f8c0f72b0d4'
            '1326062c0a150f7c1d3d3d5cb034e3c554e50239b9a2bdaa307b9e00425d3c0b')
validpgpkeys=()

prepare() {
	cd "$srcdir"
	gendesk -n -f \
	--pkgname=${pkgbase::-4} \
	--pkgdesc="$pkgdesc" \
	--exec="${pkgbase::-4}" \
	--icon=${pkgbase::-4} \
	--terminal=false \
	--categories="Education;Office;Utilities;Science;Math"
	gendesk -n -f \
	--pkgname=r47 \
	--pkgdesc="${pkgdesc/C/R}" \
	--exec="r47" \
	--icon=r47 \
	--terminal=false \
	--categories="Education;Office;Utilities;Science;Math"
}

package_c47-bin() {
	provides=("${pkgname::-4}")
	conflicts=("${pkgname::-4}")
	cd "${pkgname::-4}-linux-$pkgver"
	install -Dm755 ${pkgname::-4} "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
	install -Dm755 C47__StandardFont.ttf -t "$pkgdir/usr/share/${pkgname::-4}"
	cp -a res "$pkgdir/usr/share/${pkgname::-4}/res"
	install -dm755 "$pkgdir/usr/bin"
	cat >> "$pkgdir/usr/bin/${pkgname::-4}" <<-EOF
#!/usr/bin/env sh
[[ ! -d "\$HOME/.config/${pkgname::-4}" ]] && mkdir -p "\$HOME/.config/${pkgname::-4}"
cd "\$HOME/.config/${pkgname::-4}" || exit
ln -s /usr/share/${pkgname::-4}/res ./
ln -s /usr/lib/${pkgname::-4}/${pkgname::-4} ${pkgname::-4}
ln -s /usr/share/${pkgname::-4}/C47__StandardFont.ttf C47__StandardFont.ttf
./${pkgname::-4} "\$@"
wait
if [[ -d res ]]
then
rm res
fi
if [[ -f ${pkgname::-4} ]]
then
rm ${pkgname::-4}
fi
if [[ -f C47__StandardFont.ttf ]]
then
rm C47__StandardFont.ttf
fi
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}"

	install -Dm644 "$srcdir/c47.desktop" "$pkgdir/usr/share/applications/c47.desktop"
	cd "$srcdir/${_pkgname}-${pkgver}/res"
	icotool -x "${pkgname::-4}.ico"
	_count=1
	for _size in {16,24,32,48,64,128,256};
	do
		case $_size in
			16|24|32|48|64)
				_depth=8
			;;
			128)
				_depth=24
			;;
			256)
				_depth=32
			;;
		esac

		install -Dm644 ${pkgname::-4}_${_count}_${_size}x${_size}x${_depth}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname::-4}.png"
		_count=$(($_count + 1))

	done
	
}
package_r47-bin() {
	provides=("${pkgname::-4}")
	conflicts=("${pkgname::-4}")
	pkgdesc="${pkgdesc/C/R}"
	cd "${pkgbase::-4}-linux-$pkgver"
	install -Dm755 ${pkgname::-4} "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
	install -Dm755 C47__StandardFont.ttf -t "$pkgdir/usr/share/${pkgname::-4}"
	cp -a res "$pkgdir/usr/share/${pkgname::-4}/res"
	install -dm755 "$pkgdir/usr/bin"
	cat >> "$pkgdir/usr/bin/${pkgname::-4}" <<-EOF
#!/usr/bin/env sh
[[ ! -d "\$HOME/.config/${pkgname::-4}" ]] && mkdir -p "\$HOME/.config/${pkgname::-4}"
cd "\$HOME/.config/${pkgname::-4}" || exit
ln -s /usr/share/${pkgname::-4}/res ./
ln -s /usr/lib/${pkgname::-4}/${pkgname::-4} ${pkgname::-4}
ln -s /usr/share/${pkgname::-4}/C47__StandardFont.ttf C47__StandardFont.ttf
./${pkgname::-4} "\$@"
wait
if [[ -d res ]]
then
rm res
fi
if [[ -f ${pkgname::-4} ]]
then
rm ${pkgname::-4}
fi
if [[ -f C47__StandardFont.ttf ]]
then
rm C47__StandardFont.ttf
fi
EOF
	chmod 755 "$pkgdir/usr/bin/${pkgname::-4}"

	install -Dm644 "$srcdir/r47.desktop" "$pkgdir/usr/share/applications/r47.desktop"
	cd "$srcdir/${_pkgname}-${pkgver}/res"
	icotool -x "${pkgname::-4}.ico"
	_count=1
	for _size in {16,24,32,48,64,128,256};
	do
		case $_size in
			16|24|32|48|64)
				_depth=8
			;;
			128|256)
				_depth=32
			;;
		esac

		install -Dm644 ${pkgname::-4}_${_count}_${_size}x${_size}x${_depth}.png "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname::-4}.png"
		_count=$(($_count + 1))

	done
	
}
