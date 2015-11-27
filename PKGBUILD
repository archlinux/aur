# $Id: PKGBUILD 244503 2015-08-23 08:42:41Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-ubuntu
_pkgname=openssh
pkgver=6.9p1
pkgrel=1
pkgdesc='OpenSSH backported from Ubuntu'
url='http://www.openssh.org/portable.html'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('linux-headers')
conflicts=(${_pkgname})
provides=(${_pkgname}-${pkgver})
depends=('krb5' 'openssl' 'libedit' 'ldns')
optdepends=('xorg-xauth: X11 forwarding'
            'x11-ssh-askpass: input passphrase in X')
validpgpkeys=('59C2118ED206D927E667EBE3D3E5F56B6D920D30')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz"
        'sshdgenkeys.service'
        'sshd@.service'
        'sshd.service'
        'sshd.socket'
        'sshd.conf'
        'sshd.pam'
        'gssapi.patch'
        'restore-tcp-wrappers.patch'
        'selinux-role.patch'
        'ssh-vulnkey-compat.patch'
        'ssh1-keepalive.patch'
        'keepalive-extensions.patch'
        'syslog-level-silent.patch'
        'quieter-signals.patch'
        'helpful-wait-terminate.patch'
        'consolekit.patch'
        'user-group-modes.patch'
        'scp-quoting.patch'
        'shell-path.patch'
        'dnssec-sshfp.patch'
        'auth-log-verbosity.patch'
        'mention-ssh-keygen-on-keychange.patch'
        'package-versioning.patch'
        'debian-banner.patch'
        'authorized-keys-man-symlink.patch'
        'lintian-symlink-pickiness.patch'
        'openbsd-docs.patch'
        'ssh-argv0.patch'
        'doc-hash-tab-completion.patch'
        'doc-upstart.patch'
        'ssh-agent-setgid.patch'
        'no-openssl-version-status.patch'
        'gnome-ssh-askpass2-icon.patch'
        'sigstop.patch'
        'debian-config.patch'
        'backport-fix-pty-permissions.patch'
        'backport-do-not-resend-username-to-pam.patch'
        'backport-pam-use-after-free.patch'
        'backport-kbdint-duplicates.patch'
        'backport-regress-principals-command-noexec.patch'
)
sha1sums=('86ab57f00d0fd9bf302760f2f6deac1b6e9df265'
          'cc1ceec606c98c7407e7ac21ade23aed81e31405'
          '6a0ff3305692cf83aca96e10f3bb51e1c26fccda'
          'ec49c6beba923e201505f5669cea48cad29014db'
          'e12fa910b26a5634e5a6ac39ce1399a132cf6796'
          'c9b2e4ce259cd62ddb00364d3ee6f00a8bf2d05f'
          'd93dca5ebda4610ff7647187f8928a3de28703f3'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')

backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd')

install=install

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 -i ../gssapi.patch
    patch -p1 -i ../restore-tcp-wrappers.patch
    patch -p1 -i ../selinux-role.patch
    patch -p1 -i ../ssh-vulnkey-compat.patch
    patch -p1 -i ../ssh1-keepalive.patch
    patch -p1 -i ../keepalive-extensions.patch
    patch -p1 -i ../syslog-level-silent.patch
    patch -p1 -i ../quieter-signals.patch
    patch -p1 -i ../helpful-wait-terminate.patch
    patch -p1 -i ../consolekit.patch
    patch -p1 -i ../user-group-modes.patch
    patch -p1 -i ../scp-quoting.patch
    patch -p1 -i ../shell-path.patch
    patch -p1 -i ../dnssec-sshfp.patch
    patch -p1 -i ../auth-log-verbosity.patch
    patch -p1 -i ../mention-ssh-keygen-on-keychange.patch
    patch -p1 -i ../package-versioning.patch
    patch -p1 -i ../debian-banner.patch
    patch -p1 -i ../authorized-keys-man-symlink.patch
    patch -p1 -i ../lintian-symlink-pickiness.patch
    patch -p1 -i ../openbsd-docs.patch
    patch -p1 -i ../ssh-argv0.patch
    patch -p1 -i ../doc-hash-tab-completion.patch
    patch -p1 -i ../doc-upstart.patch
    patch -p1 -i ../ssh-agent-setgid.patch
    patch -p1 -i ../no-openssl-version-status.patch
    patch -p1 -i ../gnome-ssh-askpass2-icon.patch
    patch -p1 -i ../sigstop.patch
    patch -p1 -i ../debian-config.patch
    patch -p1 -i ../backport-fix-pty-permissions.patch
    patch -p1 -i ../backport-do-not-resend-username-to-pam.patch
    patch -p1 -i ../backport-pam-use-after-free.patch
    patch -p1 -i ../backport-kbdint-duplicates.patch
    patch -p1 -i ../backport-regress-principals-command-noexec.patch
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-ldns \
		--with-libedit \
		--with-ssl-engine \
		--with-pam \
		--with-privsep-user=nobody \
		--with-kerberos5=/usr \
		--with-xauth=/usr/bin/xauth \
		--with-mantype=man \
		--with-md5-passwords \
		--with-pid-dir=/run \
        --with-gssapi \

	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make tests || true
	# hard to suitably test connectivity:
	# - fails with /bin/false as login shell
	# - fails with firewall activated, etc.
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENCE"

	install -Dm644 ../sshdgenkeys.service "${pkgdir}"/usr/lib/systemd/system/sshdgenkeys.service
	install -Dm644 ../sshd@.service "${pkgdir}"/usr/lib/systemd/system/sshd@.service
	install -Dm644 ../sshd.service "${pkgdir}"/usr/lib/systemd/system/sshd.service
	install -Dm644 ../sshd.socket "${pkgdir}"/usr/lib/systemd/system/sshd.socket
	install -Dm644 ../sshd.conf "${pkgdir}"/usr/lib/tmpfiles.d/sshd.conf
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd

	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	sed \
		-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#PrintMotd yes$/c PrintMotd no # pam does that' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
}
