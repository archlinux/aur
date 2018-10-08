# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
# Contributor: Muhammed Uluyol <uluyol0@gmail.com>

pkgname=foo2zjs-nightly
pkgver=20180920
pkgrel=1
pkgdesc="foo2zjs Printer Drivers (automatically updated). Includes also foo2hp, foo2hbpl, foo2oak, foo2xqx, foo2qpdl, foo2slx, foo2hiperc and foo2lava drivers."
url="http://foo2zjs.rkkda.com/"
license=('GPL' 'custom')
depends=('psutils' 'cups')
conflicts=('foo2zjs')
provides=('foo2zjs')
replaces=('foo2zjs')
makedepends=('unzip' 'bc' 'wget' 'foomatic-db-engine')
optdepends=('tix: required by hplj10xx_gui.tcl')
arch=('i686' 'x86_64')
options=('!emptydirs' '!ccache')
install='foo2zjs.install'

_patches=(
	0001-Makefile-DESTDIR-support.patch
	0002-Makefile-general-fixes.patch
	0003-Rework-firmware-loading.patch
	0004-Makefile-fix-generating-.ppd-in-place.patch
	0005-Makefile-leverage-default-rules-as-much-as-possible-.patch
	0006-Makefile-do-not-blacklist-usblp-seems-unnecessary-co.patch
	0007-Makefile-create-manpages-in-subdirs-via-their-Makefi.patch
)

_firmware=(
        http://foo2hiperc.rkkda.com/icm/okic301.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic310.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic3200.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic3400.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic511.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic5600.tar.gz
        http://foo2hiperc.rkkda.com/icm/okic810.tar.gz
        http://foo2hp.rkkda.com/icm/hp1215.tar.gz
        http://foo2hp.rkkda.com/icm/hpclj2500.tar.gz
        http://foo2hp.rkkda.com/icm/hpclj2600n.tar.gz
        http://foo2lava.rkkda.com/icm/km-1600.tar.gz
        http://foo2lava.rkkda.com/icm/km2530.tar.gz
        http://foo2qpdl.rkkda.com/icm/samclp300.tar.gz
        http://foo2qpdl.rkkda.com/icm/samclp315.tar.gz
        http://foo2slx.rkkda.com/icm/lexc500.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihp1000.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihp1005.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihp1018.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihp1020.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihpP1005.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihpP1006.tar.gz
        http://foo2zjs.rkkda.com/firmware/sihpP1505.tar.gz
        http://foo2zjs.rkkda.com/icm/dl2300.tar.gz
        http://foo2zjs.rkkda.com/icm/hp-cp1025.tar.gz
        http://foo2zjs.rkkda.com/icm/km2430.tar.gz
)

pkgver() {
	local date=$(curl -s 'http://foo2zjs.rkkda.com' | sed -nre 's|.*Tarball last modified: <i>(.+)</i>.*|\1|p')
	if ! [[ "$date" ]]; then
		error "Could not extract package last modification date '$date', please report this to the maintainer"
		return 1
	fi

	date +%Y%m%d -u -d "$date"
}

# `source` is evaluated before `pkgver()`, so a lazy downloader will not re-download the existing source file even if version changes.
# Hence, manually include `pkgver()` in the source file name so that it will be re-downloaded if version changes.
source=(
	"foo2zjs-$(pkgver).tar.gz::http://foo2zjs.rkkda.com/foo2zjs.tar.gz"
	"${_patches[@]}"
	"${_firmware[@]}"
	'listweb.patch'
	'unweb.patch'
)
noextract=(
	"${_firmware[@]##*/}"
)
sha256sums=('SKIP'
            'f9b39a2e0d379d631e70e5e7499d310c50151783d1f5fc2ed4af1c68b2d10d15'
            'e55a9767886f517d794a06a5d272f87b4f26686a6058bc758841e0a13f7ede56'
            '2e045dd9c7f04f5bf0dca1c8ff538ec52e3902f93e795ca6e4c089dff0dd77f8'
            'e4eb7d768d6f3c8d7a5387b2e23686b94576027f79912bbfec6db7856a8380a0'
            '7f6d5e7d3c7631461eaa6b24f632e4ba0bfab11b29bc7ac3b1c0dfae4aa5a510'
            '91329cb3cb34f72f7b5ea7663e0f421274da4393aaa91e8fa70240846ac7876f'
            '9db83cb68d9277b6e0b4b607d5b662ac8935e5cee75a65bc7a000242c4528ed9'
            'f2fffb9adb0d3a9be617fb760ee2ad416cf5a0473f8a7637a591355ef50cf029'
            '362017f58a9bde0cb677c363969f8c9694c878fbc883ee20940933d0bc273fd0'
            '5ceaf5e67efdca086c873b570eee1de397e114c1cdcfed1f2c3500c90a9e7608'
            '38533c32155ee7f3288289fcb306929c5badba19ff2f493167077252d500f41a'
            '733e1a7b117a06d078ac3fa7420a67aad66a2d3a8ff834ba8c0950ece4adba0a'
            'cb8db01f18433d54cbddc466a2a6260d2c13fd8e1e100dde396e410231a65135'
            'e13fd19b492a938ea8d955ea56653eeabdc97c2ad7409a368f6bc511943e4877'
            'c3d2262d0c37a3246fd51ca075808f9e97693fbcf623c5f689976809c5433617'
            '28f3641472d50e713aaa7476954fef5b677901aef126ea0ac7958dfe7462bf10'
            '5ebb4cdcbc99d049a611cc398e4fbe35152e287e743b21b70a138d3b462479b9'
            '25a8bee2c02dbd659d3bdacb2e8aa2a2a0ee611af5bd157d3a6feaea6731bc01'
            '03bf4153665162ab001096d70291a9657022e388ce7e6f347d859b41aa73bedd'
            '32ca771dd35b1fc3e753ff00f30aa3ce406f66059a591a5f8179f798a0c9ddbe'
            '7f64829348482561853a805ec1b3655fdc1976a028a95761c031f5d6bf975989'
            '774ccbfef108bec708bf71e15299a1120aa82d3bc39a921062dc76ee3d866ff2'
            '61a4ac9f94e9749a4e3c8971a7bb8d610608bea6bd2aedcb98a4f307553955f6'
            '42d6ab614d998a274ac3b8a4520595dcb251a9b051ba9f1e2a70e6ad54cce7b3'
            '1c24a8ab5c9921a1982387f52685779a5a7c911a54119352bcaa64f01830ec82'
            'ec4665c6704c2db3cfaeb71bb06f1bbc9449c030504b04f533a84bdfae89f966'
            'a20e4b550a418b99a28a320d7834f50ae0b126f0cbc3b0e84ba0e0bf5de872a0'
            'b9efe6926fc4cac578b18b5ef8adab13e87c80a25430309110e3f61ace5bcf8f'
            '2700916d01ebb693a9a4e34a1858fe44229a1bd3bc7abe08ce0e32be3659e58b'
            'e0234217bfd84fec0404d2a90ad09c8269e3f7c263708ccd6d872b1f8e6858ab'
            'f3784a3c297c37ae3f2404c7fe9a359a1171131d57bd0e4d2c7d7ce814664c6a'
            '3b4701d2309aca006fd295c0a208b72136591ccee812181429795e405991f04f'
            'ac43210aafee388600979b88b6642b5f7a8cd8dd9dcdd7cfee0ab790867c16eb'
            'bf007787256d55bcc468a0e77d244a3a6ab383e38a6849ddcf6b3647eb965c0e')

prepare() {
	cd foo2zjs

	for p in "${_patches[@]}"; do
		patch -Np1 -i "$srcdir/$p"
	done

	msg "Processing pre-downloaded 'getweb' firmware"

	make getweb
	chmod 755 getweb

	patch -p1 -o listweb getweb "${srcdir}/listweb.patch"
	chmod 755 listweb
	readarray -t _new_firmware < <(./listweb all | sort -u)
	if [[ "${_new_firmware[*]}" != "${_firmware[*]}" ]]; then
		echo "_firmware=("; printf "\t%s\n" "${_new_firmware[@]}"; echo ")"
		#error "Firmware list changed in upstream:\n$(diff -u <(printf '%s\n' "${_firmware[@]}") <(printf '%s\n' "${_new_firmware[@]}"))\n\nPlease report this to the maintainer."
		return 1
	fi

	patch -p1 getweb "${srcdir}/unweb.patch"
	srcdir="$srcdir" ./getweb all
}

build() {
	cd foo2zjs

	make all ppd
}

package() {
	cd foo2zjs

	install -d "${pkgdir}"/usr/share/{applications,pixmaps,cups/model}
	make DESTDIR="${pkgdir}" install install-hotplug
	#install -m755 getweb "${pkgdir}/usr/bin"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
