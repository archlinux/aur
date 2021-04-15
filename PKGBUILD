# Maintainer: Sam Mulvey (Refutationalist) <archlinux@sammulvey.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Chris Chapman (cman) <chris.chapman@aggiemail.usu.edu>

# Build Options
_build_stubdom=${build_stubdom:-false}
_build_qemu=${build_qemu:-true}

# Check http://xenbits.xen.org/xen-extfiles/ for updates
_gmp=4.3.2
_grub=0.97
_lwip=1.3.0
_newlib=1.16.0
_pciutils=2.2.9
_polarssl=1.1.4
_tpm_emulator=0.7.4
_zlib=1.2.3

pkgbase=xen
pkgname=("xen" "xen-docs")
pkgver=4.15.0
pkgrel=1
pkgdesc='Open-source type-1 or baremetal hypervisor'
arch=('x86_64')
url='https://xenproject.org/'
license=('GPL2')
options=(!buildflags)

# Original depends line
makedepends=(
	'zlib' 'python' 'ncurses' 'openssl' 'libx11' 'libuuid.so' 'yajl' 'libaio' 'glib2' 'pkgconf'
	'bridge-utils' 'iproute2' 'inetutils' 'acpica' 'lib32-glibc' 'gnutls'
	'vde2' 'lzo' 'pciutils' 'sdl2'
) # last line from namcap, these depends are the xen depends
# Actual makedepends.
makedepends+=('wget' 'pandoc' 'valgrind' 'git' 'bin86' 'dev86' 'bison' 'gettext' 'flex' 'pixman' 'ocaml' 'fig2dev')

_source=(
	"https://downloads.xenproject.org/release/xen/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig}
	"efi-xen.cfg"
	"xen.conf"
	"tmpfiles.conf"
	"xen-ucode-extract.sh"
	"xen-intel-ucode.hook"
	"xen-amd-ucode.hook"
	"no-ld-no-pie.patch"
)

validpgpkeys=('23E3222C145F4475FA8060A783FE14C957E82BD9') # Xen.org Xen tree code signing (signatures on the xen hypervisor and tools) <pgp@xen.org>


# Follow the Xen securite mailing lists, and if a patch is applicable to our package
# add the URL here.
_patches=(
)


# Sources required for building stubdom
_stubdom_source=(
	"http://xenbits.xen.org/xen-extfiles/gmp-$_gmp.tar.bz2"
	"http://xenbits.xen.org/xen-extfiles/grub-$_grub.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/lwip-$_lwip.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/newlib-$_newlib.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/pciutils-$_pciutils.tar.bz2"
	"http://xenbits.xen.org/xen-extfiles/polarssl-$_polarssl-gpl.tgz"
	"http://xenbits.xen.org/xen-extfiles/tpm_emulator-$_tpm_emulator.tar.gz"
	"http://xenbits.xen.org/xen-extfiles/zlib-$_zlib.tar.gz"
)


# from cheap hack known as break_out_sums.sh
_sha512sums=(
	"93683b8a97387ca5f003c635a11d163e61c87dbdc9a03081f9155fe87b49f1dfa74ce243fcd5e04dc009353a36e2375b786f1ebde828b5951a094cd64197b4c7" # xen-4.15.0.tar.gz
	"7ca2894ece626a116e03f0e3e2ddf36c7cf26b1db0eef410bb93acae32897042b087f670a416b13c5df8f1c8bd9d848ad075f1ce8a651b3341ec20b56daf21ae" # xen-4.15.0.tar.gz.sig
	"1bbcbcd9fb8344a207409ec9f0064a45b726416f043f902ca587f5e4fa58497a759be4ffd584fa32318e960aa478864cc05ec026c444e8d27ca8e3248bd67420" # efi-xen.cfg
	"ccaa2ff82e4203b11e5dec9aeccac2e165721d8067e0094603ecaa7a70b78c9eb9e2287a32687883d26b6ceae6f8d2ad7636ddf949eb658637b3ceaa6999711b" # xen.conf
	"53ba61587cc2e84044e935531ed161e22c36d9e90b43cab7b8e63bcc531deeefacca301b5dff39ce89210f06f1d1e4f4f5cf49d658ed5d9038c707e3c95c66ef" # tmpfiles.conf
	"a9230ec6ef9636ac3f3e4b72b1747ee8c4648a8bf4bd8dc3650365e34f1f67474429dbdd24996907d277b0ff5f235574643e781cb3ff37da954e899ddadbe0d6" # xen-ucode-extract.sh
	"7a832de9b35f4b77ee80d33310b23886f4d48d1d42c3d6ef6f8e2b428bec7332a285336864b61cfa01d9a14c2023674015beb7527bd5849b069f2be88e6500cd" # xen-intel-ucode.hook
	"99921b94a29fa7988c7fb5c17da8e598e777c972d6cae8c8643c991e5ff911a25525345ea8913945313d5c49fecf9da8cc3b83d47ab03928341e917b304370a9" # xen-amd-ucode.hook
	"72edbacdb2b3b4449448e1bf7a6b31b58234eed1abe010db6dcf4033158edf095b081bc6eb89cde3156432dd35c449e1954aeefb2c4bc785a5d3f93de7b0fa76" # no-ld-no-pie.patch
)

_patch_sums=(
)


_stub_sums=(
	"2e0b0fd23e6f10742a5517981e5171c6e88b0a93c83da701b296f5c0861d72c19782daab589a7eac3f9032152a0fc7eff7f5362db8fccc4859564a9aa82329cf" # gmp-4.3.2.tar.bz2
	"c2bc9ffc8583aeae71cee9ddcc4418969768d4e3764d47307da54f93981c0109fb07d84b061b3a3628bd00ba4d14a54742bc04848110eb3ae8ca25dbfbaabadb" # grub-0.97.tar.gz
	"1465b58279af1647f909450e394fe002ca165f0ff4a0254bfa9fe0e64316f50facdde2729d79a4e632565b4500cf4d6c74192ac0dd3bc9fe09129bbd67ba089d" # lwip-1.3.0.tar.gz
	"40eb96bbc6736a16b6399e0cdb73e853d0d90b685c967e77899183446664d64570277a633fdafdefc351b46ce210a99115769a1d9f47ac749d7e82837d4d1ac3" # newlib-1.16.0.tar.gz
	"2b3d98d027e46d8c08037366dde6f0781ca03c610ef2b380984639e4ef39899ed8d8b8e4cd9c9dc54df101279b95879bd66bfd4d04ad07fef41e847ea7ae32b5" # pciutils-2.2.9.tar.bz2
	"88da614e4d3f4409c4fd3bb3e44c7587ba051e3fed4e33d526069a67e8180212e1ea22da984656f50e290049f60ddca65383e5983c0f8884f648d71f698303ad" # polarssl-1.1.4-gpl.tgz
	"4928b5b82f57645be9408362706ff2c4d9baa635b21b0d41b1c82930e8c60a759b1ea4fa74d7e6c7cae1b7692d006aa5cb72df0c3b88bf049779aa2b566f9d35" # tpm_emulator-0.7.4.tar.gz
	"021b958fcd0d346c4ba761bcf0cc40f3522de6186cf5a0a6ea34a70504ce9622b1c2626fce40675bc8282cf5f5ade18473656abc38050f72f5d6480507a2106e" # zlib-1.2.3.tar.gz
)



# Simplify things for makepkg
source=( "${_source[@]}" "${_patches[@]}" )
sha512sums=( "${_sha512sums[@]}" "${_patch_sums[@]}" )

for file in "${_patches[@]}"; do
	noextract+=( $(basename ${file}) )
done



# stubdum handling
if [ "${_build_stubdom}" == "true" ]; then
	source=("${source[@]}" "${_stubdom_source[@]}")
	sha512sums=("${sha512sums[@]}" "${_stub_sums[@]}")

	# Add in automagic dependency in order to build vtpm and vtpmmgr stubdoms
	makedepends+=('cmake')

	for file in "${_stubdom_source[@]}"; do
		noextract+=( $(basename ${file}) )
	done

	_config_stubdom='--enable-stubdom'
else
	_config_stubdom='--disable-stubdom'
fi

if [ "${_build_qemu}" == "true" ]; then
	_config_qemu=""
else
	_config_qemu="--with-system-qemu=/usr/bin/qemu-system-x86_64"
fi




# TODO: Setup users, dirs, etc.

prepare() {

	cd "${pkgbase}-${pkgver}"

	patch -p1 < ../no-ld-no-pie.patch

	if [ "${_build_stubdom}" == "true" ]; then

		for file in "${_stubdom_source[@]}"; do
			cp ../$(basename ${file}) stubdom/
		done

	fi


	for patchurl in "${_patches[@]}"; do
		patch=$(basename $patchurl)
		echo "==> Applying security patch '${patch}'..."
		patch -p1 < "../${patch}"
	done

	# Fix Install Paths.
	sed 's,/var/run,/run,g' -i tools/hotplug/Linux/locking.sh
	sed 's,/var/run,/run,g' -i tools/misc/xenpvnetboot
	sed 's,/var/run,/run,g' -i tools/xenmon/xenbaked.c
	sed 's,/var/run,/run,g' -i tools/xenmon/xenmon.py
	sed 's,/var/run,/run,g' -i tools/pygrub/src/pygrub
}

build() {
	cd "${pkgbase}-${pkgver}"

	if [ "${_build_stubdom}" == "true" ]; then
		echo "NOTE: Xen build with stubdom support."
	fi

	if [ "${_build_qemu}" == "true" ]; then
		echo "NOTE: Xen build with integrated QEMU."
	fi


	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--with-rundir=/run \
		--enable-systemd \
		--disable-qemu-traditional \
		${_config_stubdom} \
		${_config_qemu} \
		--with-sysconfig-leaf-dir=conf.d \
		--with-system-ovmf=/usr/share/ovmf/x64/OVMF.fd \
		--with-system-seabios=/usr/share/qemu/bios-256k.bin

	make XEN_VENDORVERSION=arch
}

package_xen() {
	pkgdesc='Open-source type-1 or baremetal hypervisor'

	depends=(
		'zlib' 'python' 'ncurses' 'openssl' 'libx11' 'libuuid.so' 'yajl' 'libaio' 'glib2' 'pkgconf'
		'bridge-utils' 'iproute2' 'inetutils' 'acpica' 'lib32-glibc' 'gnutls'
		'vde2' 'lzo' 'pciutils' 'sdl2'
	)

	optdepends=(
		'edk2-ovmf: UEFI support'
		'seabios: SeaBIOS payload support'
		'xen-docs: HTML documentation and man pages'
		'grub-xen-git: GRUB and pvgrub2 bootloader support'
		'linux-headers: extract bootable non-zstd kernel for recent kernels'
	)

	if [ "${_build_qemu}" == "false" ]; then
		optdepends+=("qemu: HVM and PV support")
	fi

	install="xen.install"


	backup=(
		"etc/conf.d/xencommons"
		"etc/conf.d/xendomains"
		"etc/xen/efi-xen.cfg"
		"etc/xen/cpupool"
		"etc/xen/xl.conf"
	)


	cd "${pkgbase}-${pkgver}"


	make DESTDIR="$pkgdir" install

	mv "$pkgdir"/usr/lib64/efi "$pkgdir"/usr/lib/efi
	rm -rf "$pkgdir"{/var/run,/usr/lib64}
	#  This feels like The Arch Way, really.
	find "${pkgdir}/usr/lib/efi" -type l -delete
	mv "${pkgdir}/usr/lib/efi/xen-${pkgver}.efi" "${pkgdir}/usr/lib/efi/xen.efi"


	[ -d "$pkgdir"/etc/xen/scripts ] && backup+=($(find "$pkgdir"/etc/xen/scripts/ -type f | sed "s|^$pkgdir/||g"))

	mkdir -p "${pkgdir}/var/log/xen/console"

	# Remove hypervisor symlinks.
	find "${pkgdir}/boot" -type l -delete
	# Continued: This feels like The Arch Way, really.
	mv "${pkgdir}/boot/xen-${pkgver}.gz" "${pkgdir}/boot/xen.gz"

	# Remove syms.
	find "${pkgdir}/usr/lib/debug" -type f \( -name '*-syms*' -or -name '*\.map' \) -delete
	rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen/boot"
	rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen"
	rmdir "${pkgdir}/usr/lib/debug/usr/lib"
	rmdir "${pkgdir}/usr/lib/debug/usr"
	rmdir "${pkgdir}/usr/lib/debug"

	# Remove SysVinit files.
	rm -r "${pkgdir}/etc/init.d"

	# Install files for Arch Linux.
	install -D -m 0644 "${srcdir}/efi-xen.cfg" "${pkgdir}/etc/xen/efi-xen.cfg"
	install -D -m 0644 "${srcdir}/xen.conf" "${pkgdir}/usr/lib/modules-load.d/xen.conf"
	install -D -m 0644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"

	# microcode hooks
	mkdir -p "${pkgdir}/usr/share/libalpm/scripts"     "${pkgdir}/usr/share/libalpm/hooks"
	install -m755 "${srcdir}/xen-ucode-extract.sh"     "${pkgdir}/usr/share/libalpm/scripts"
	install -m644 "${srcdir}/xen-intel-ucode.hook"     "${pkgdir}/usr/share/libalpm/hooks"
	install -m644 "${srcdir}/xen-amd-ucode.hook"       "${pkgdir}/usr/share/libalpm/hooks"

	# Remove documentation (included in separate xen-docs package).
	rm -r "${pkgdir}/usr/share/doc"
	rm -r "${pkgdir}/usr/share/man"

}

package_xen-docs() {
	pkgdesc="Xen hypervisor documentation and man pages"
	arch=("any")
	cd "${pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install-docs
}
