# Maintainer: lantw44 (at) gmail (dot) com
# Modified from guix-git 20130119 PKGBUILD

# In order to verify the PGP signature of the source archive, you may need to
# use this command to download the needed public key:
#   gpg --recv-keys 3CE464558A84FDC69DB40CFB090B11993D9AEBB5

pkgname=guix
pkgver=0.13.0
pkgrel=1
pkgdesc="A purely functional package manager for the GNU system"
arch=('x86_64' 'i686')
url="https://www.gnu.org/software/guix/"
license=('GPL3')
options=('!strip')
makedepends=(
  'bash-completion'
  'guile-json'
  'guile-ssh>=0.10.2'
  'help2man')
depends=(
  'guile>=2.0.9'
  'sqlite>=3.6.19'
  'bzip2'
  'gnutls'
  'libgcrypt'
  'zlib')
optdepends=(
  'bash-completion: to enable bash programmable completion'
  'guile-json: to import packages from cpan, gem, pypi'
  'guile-ssh: to offload builds to other machines')
source=(
  "https://alpha.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
  "aarch64-linux-20170217-guile-2.0.14.tar.xz::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/aarch64-linux/20170217/guile-2.0.14.tar.xz"
  "aarch64-linux-20170217-guile-2.0.14.tar.xz.sig::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/aarch64-linux/20170217/guile-2.0.14.tar.xz.sig"
  "armhf-linux-20150101-guile-2.0.11.tar.xz::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/armhf-linux/20150101/guile-2.0.11.tar.xz"
  "armhf-linux-20150101-guile-2.0.11.tar.xz.sig::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/armhf-linux/20150101/guile-2.0.11.tar.xz.sig"
  "i686-linux-20131110-guile-2.0.9.tar.xz::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/i686-linux/20131110/guile-2.0.9.tar.xz"
# "i686-linux-20131110-guile-2.0.9.tar.xz.sig::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/i686-linux/20131110/guile-2.0.9.tar.xz.sig"
  "mips64el-linux-20131110-guile-2.0.9.tar.xz::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/mips64el-linux/20131110/guile-2.0.9.tar.xz"
# "mips64el-linux-20131110-guile-2.0.9.tar.xz.sig::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/mips64el-linux/20131110/guile-2.0.9.tar.xz.sig"
  "x86_64-linux-20131110-guile-2.0.9.tar.xz::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/x86_64-linux/20131110/guile-2.0.9.tar.xz"
# "x86_64-linux-20131110-guile-2.0.9.tar.xz.sig::https://alpha.gnu.org/gnu/${pkgname}/bootstrap/x86_64-linux/20131110/guile-2.0.9.tar.xz.sig"
)
install="${pkgname}.install"
sha1sums=(
  '8de41773236eb54c50fd976fb614ba343c5ebd91'
  '8e966f6ffef05baea3e3bcbf38f1e0c27a4c05a6'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
# 'SKIP'
  'SKIP'
# 'SKIP'
  'SKIP'
# 'SKIP'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '3939909f24dcb955621aa7f81ecde6844bea8a083969c2d275c55699af123ebe'
  'bfceb1a0cb92c9182e5bc2bfe9e728078df0f5f86e6580820ead845d7f11f3c5'
  'e551d05d4d385d6706ab8d574856a087758294dc90ab4c06e70a157a685e23d6'
  '4ceb3b490e2eed1631ec204d68ebf2a91806f6d1c438fc3a8d744b3f0351633d'
  'b757cd46bf13ecac83fb8e955fb50096ac2d17bb610ca8eb816f29302a00a846'
# '5c710ad8efa927711347cb585ceec25d99c3b3065955060275076be55f46f228'
  '994680f0001346864aa2c2cc5110f380ee7518dcd701c614291682b8e948f73b'
# 'd22c325e7d64b805679cc449b8865f7ac7629b83c71a6ae9812541408bac1952'
  '037b103522a2d0d7d69c7ffd8de683dfe5bb4b59c1fafd70b4ffd397fd2f57f0'
# '50ec32f47dd659583d7ee633b8d6d4180b413c3680b1628ab6346241ac2c2b46'
)
validpgpkeys=('3CE464558A84FDC69DB40CFB090B11993D9AEBB5')
noextract=(
  'aarch64-linux-20170217-guile-2.0.14.tar.xz'
  'armhf-linux-20150101-guile-2.0.11.tar.xz'
  'i686-linux-20131110-guile-2.0.9.tar.xz'
  'mips64el-linux-20131110-guile-2.0.9.tar.xz'
  'x86_64-linux-20131110-guile-2.0.9.tar.xz')
_noextract_dest_map=(
  'gnu/packages/bootstrap/aarch64-linux/guile-2.0.14.tar.xz'
  'gnu/packages/bootstrap/armhf-linux/guile-2.0.11.tar.xz'
  'gnu/packages/bootstrap/i686-linux/guile-2.0.9.tar.xz'
  'gnu/packages/bootstrap/mips64el-linux/guile-2.0.9.tar.xz'
  'gnu/packages/bootstrap/x86_64-linux/guile-2.0.9.tar.xz')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	for index in $(seq 0 $((${#noextract[@]} - 1))); do
		cp "${srcdir}/${noextract[${index}]}" "${_noextract_dest_map[${index}]}"
	done
}

build() {
	local bash_completion_dir="`pkg-config --variable=completionsdir bash-completion`"
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin \
		--libexecdir="/usr/lib/${pkgname}" --localstatedir=/var \
		--sysconfdir=/etc --with-bash-completion-dir="${bash_completion_dir}" \
		--disable-rpath
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Check whether the current working directory is too long
	cwd_str="$(pwd)"
	cwd_len="${#cwd_str}"
	if [ "${cwd_len}" -gt 46 ]; then
		error "${cwd_str} is too long."
		error "The working directory cannot be longer than 46 bytes."
		false
	fi
	# Make sure we have a valid shell accepting -c option
	SHELL=/bin/sh make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	# Remove unused upstart service files
	rm -r "${pkgdir}/usr/lib/upstart"
	# Rename systemd service files provided by upstream because they are not
	# usable without previous guix installation
	local system_unit_dir="${pkgdir}/usr/lib/systemd/system"
	local guix_daemon_default="${system_unit_dir}/guix-daemon.service"
	local guix_daemon_upstream="${system_unit_dir}/guix-daemon-latest.service"
	local guix_publish_default="${system_unit_dir}/guix-publish.service"
	local guix_publish_upstream="${system_unit_dir}/guix-publish-latest.service"
	mv "${guix_daemon_default}" "${guix_daemon_upstream}"
	mv "${guix_publish_default}" "${guix_publish_upstream}"
	# Generate default systemd service files from upstream ones by fixing paths
	local guix_profile_root="/var/guix/profiles/per-user/root/guix-profile"
	sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
		-e "s|^Description=\(.*\)|Description=\1 (default)|" \
		-e "/^Environment=/d" "${guix_daemon_upstream}" \
		> "${guix_daemon_default}"
	sed -e "s|^ExecStart=${guix_profile_root}/bin|ExecStart=/usr/bin|" \
		-e "s|^Description=\(.*\)|Description=\1 (default)|" \
		-e "/^Environment=/d" "${guix_publish_upstream}" \
		> "${guix_publish_default}"
	# Make sure the above sed commands really work
	! cmp "${guix_daemon_default}" "${guix_daemon_upstream}"
	! cmp "${guix_publish_default}" "${guix_publish_upstream}"
	# Edit the description of upstream systemd service files
	sed -i "s|^Description=\(.*\)|Description=\1 (upstream)|" \
		"${guix_daemon_upstream}" "${guix_publish_upstream}"
	# The default makepkg strip option cannot be used here because binaries
	# installed in /usr/share must not be stripped.
	# To keep user-defined 'strip' and 'debug' options useful, we still
	# depend on 'tidy_strip' function provided by makepkg to do the stripping
	# work. To make the function useful, we have to temporarily remove the
	# '!strip' option from 'options' array. However, assignments to 'options'
	# cause mksrcinfo to insert wrong lines to .SRCINFO, so they have to be
	# put in eval.
	eval 'options=()'
	cd "${pkgdir}/usr/bin"
	tidy_strip
	cd "${pkgdir}/usr/lib/guix"
	tidy_strip
	eval 'options=("!strip")'
}
