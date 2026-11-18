# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh-gssapi
_pkgname=openssh
pkgver=10.6p2
_patch=1
pkgrel=1
pkgdesc="SSH protocol implementation with GSSAPI support"
arch=('x86_64')
url='https://www.openssh.com/portable.html'
license=('custom:BSD')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=(
  glibc
)
makedepends=(
  krb5
  libedit
  libfido2
  libxcrypt
  linux-headers
  openssl
  pam
  zlib
  git
)
optdepends=(
  'libfido2: FIDO/U2F support'
  'sh: for ssh-copy-id and findssl.sh'
  'x11-ssh-askpass: input passphrase in X'
  'xorg-xauth: X11 forwarding'
)
backup=(
  etc/pam.d/sshd
  etc/ssh/ssh_config
  etc/ssh/sshd_config
)
source=(
  # Use cdn.openbsd.org rather than ftp.openbsd.org for now: the TLS stack at
  # ftp.openbsd.org rejects the ClientHello sent by OpenSSL 4 with default
  # settings (decode_error, alert 50).
  https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/${_pkgname}-${pkgver}.tar.gz{,.asc}
  ${pkgname}-${pkgver}-${_patch}-gssapi.patch::https://sources.debian.org/data/main/o/${pkgname}/1:${pkgver}-${_patch}/debian/patches/gssapi.patch
  99-archlinux.conf
  ${_pkgname}.tmpfiles
  sshdgenkeys.service
  10-openssh-mark-sshd-for-restart.hook
  70-openssh-restart-sshd.hook  # remove on 2028-08-10
  sshd.service
  sshd@.service
  ssh-agent.service
  ssh-agent.socket
  sshd.pam
  LICENSE
)
sha256sums=('9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f99248398ae29d5b'
            'SKIP'
            '3f664fc3a114531df2c7d70046c77505e17d9370241cdb974b2e20fa63b6851f'
            '78b806c38bc1e246daaa941bfe7880e6eb6f53f093bea5d5868525ae6d223d30'
            'fadd31c107aee3fc6b501ca046aeb5e6fb1b0256cc5cdcade4e2c95205823a28'
            '895509cfc9abda85a479196371bb914d5c3c6e096d1a6028ca4b589275f71bbb'
            '52e23d53c1967ecce1d2f1010e965e5583dfad51590ab3af490223ad8a4bc4a9'
            '1d55162a0a35ecbbad9deb0e6108510bcb9cb9e4c6b5813217816bf2be3b8f7e'
            '25aea12c4c7fcc3636cae75b3b3cdb1c1bf513659b1e62b8ed67e02afeefc1b4'
            '3a099a7ecedfe532346c041928d2d02fd384dd26420ed284281a315782ad4075'
            '824bf888ad0cb20ff3c2e13292389eb355ab91c3d9cc2fe0c8c5c60365d4a9c7'
            'a16492e1eb9219d47a9053f0c83cdc323bff3c6f5b573bc6509ec40e40e4d04b'
            '633e24cbfcb045ba777d3e06d5f85dfaa06d44f4727d38c7fb2187c57498221d'
            '7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')
b2sums=('be4ecff2d1b72c7836a7e324b4eb68edcd0bfb4d83b8969fed97ba437c3c72df97c44db0ed9d323677b4bec4681ebcc06935824ce399faa217148bb4b518d739'
        'SKIP'
        'e054d508768ce8d3edcdc39f1172923d8c346eed7d4c3d9424ffc0cabfa7492b53bf2df14c0408df88c9f137af3a34eb5bd2af197c4ea75f5061f698d3c45be6'
        '1ff8cd4ae22efed2b4260f1e518de919c4b290be4e0b5edbc8e2225ffe63788678d1961e6f863b85974c4697428ee827bcbabad371cfc91cc8b36eae9402eb97'
        '57e77e55fcbd9d7b9951adbafe11ba62e4b8b7338c2a6fe3f163afe5b84458db042024cefbc55f9393cf17d97d067f1c2d9c61880516501bfa4e5c92371e494a'
        '883c89466a29d58d86175cfb9dca81abc846a1c253d18a0629535355775e6344bc1c02dad406fcaf5700e820d663a61f695ca9b7b55970e432e7065e0a573854'
        '120dd272dde778fee749b1606d26c2caeaba40d875231f6f1398b990fa80adba1658cd6da91e336b5fd45d7703cdbf12294e7528e1d3f90a2a33c108e84a4dbb'
        '2073efe002a178670920a68a43eb16430de6c8921efde0dc272c6c5e4b9b6f7ea06186f7ceec8b3d94af226ffd00f96c8212d9873741e5305b8e94ebc8e15ee7'
        'f0687d2acfbe81af6b26f93d5fa507f4a4566a79e7c5e27796698b81d2b5aaf56be54a3a519680f9df076adff2455ecce9ffb789a05af9fd353b69c17742b362'
        'cb6fd6d0d3c3b396be4f40cb64f686e9d8ddc25b75d44c96dfc2070fe4e6c9af75e8d72a30ed4a56ed33971632f4a0d6e92098c2304ae273dc89ae28f60b6ade'
        '6a80552260bc016757725602638478345565e1466335da8a70e0b4e49fe2e9d3b863df83764696cd91637c17dd137ed7c26188a1d795af3d024d89c9c229829b'
        'f161cdb54609bd4521d9517c5c9d97a87f7de5c7504bf46d870ee814624817050ca9f68d42a1e661ecc7c3ede1a440b5b159df18f3b16b3c2e90ecfbd0dfd258'
        '1d24cc029eccf71cee54dda84371cf9aa8d805433e751575ab237df654055dd869024b50facd8b73390717e63100c76bca28b493e0c8be9791c76a2e0d60990a'
        'a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')
validpgpkeys=('7168B983815A5EEF59A4ADFD2A3F414E736060BA')  # Damien Miller <djm@mindrot.org>

prepare() {
  cd ${_pkgname}-${pkgver}
  # remove variable (but useless) first line in config (related to upstream VCS)
  sed '/^#.*\$.*\$$/d' -i ssh{,d}_config

  # prepend configuration option to include drop-in configuration files for sshd_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/sshd_config.d/*.conf\n" | cat - sshd_config > sshd_config.tmp
  mv -v sshd_config.tmp sshd_config
  # prepend configuration option to include drop-in configuration files for ssh_config
  printf "# Include drop-in configurations\nInclude /etc/ssh/ssh_config.d/*.conf\n" | cat - ssh_config > ssh_config.tmp
  mv -v ssh_config.tmp ssh_config

  # extract separate licenses
  sed -n '89,113p' LICENCE > ../rijndael.Public-Domain.txt
  sed -n '116,145p' LICENCE > ../ssh.BSD-3-Clause.txt
  sed -n '148,209p' LICENCE > ../BSD-2-Clause.txt
  sed -n '213,218p' LICENCE > ../snprintf.Public-Domain.txt
  sed -n '222,258p' LICENCE > ../openbsd-compat.BSD-3-Clause.txt
  sed -n '260,278p' LICENCE > ../openbsd-compat.ISC.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '280,308p' LICENCE > ../openbsd-compat.MIT.txt
  sed -n '310,338p' LICENCE > ../blowfish.BSD-3-Clause.txt
  sed -n '340,368p' LICENCE > ../replacement.BSD-2-Clause.txt

  patch -Np1 -i ${srcdir}/${pkgname}-${pkgver}-${_patch}-gssapi.patch
  autoreconf
}

build() {
  local configure_options=(
    --disable-lastlog
    --disable-strip
    --libexecdir=/usr/lib/ssh
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc/ssh
    --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
    --with-kerberos5=/usr
    --with-libedit
    --with-pam
    --with-pid-dir=/run
    --with-privsep-path=/usr/share/empty.sshd
    --with-privsep-user=nobody
    --with-security-key-builtin
    --with-xauth=/usr/bin/xauth
    --without-zlib-version-check
    --with-gssapi
  )

  cd ${_pkgname}-${pkgver}

  ./configure "${configure_options[@]}"
  make
}

check() {
  # NOTE: make t-exec does not work in our build environment
  make file-tests interop-tests unit -C ${_pkgname}-${pkgver}
}

package() {
  depends+=(
    krb5 libkrb5.so libgssapi_krb5.so
    libedit libedit.so
    libxcrypt libcrypt.so
    openssl libcrypto.so
    pam libpam.so
    zlib libz.so
  )

  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install

  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/etc/ssh/sshd_config.d/"
  install -vdm 755 "$pkgdir/etc/ssh/ssh_config.d"

  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 ../*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 ../sshdgenkeys.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../sshd.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../sshd@.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 ../ssh-agent.{service,socket} -t "$pkgdir"/usr/lib/systemd/user/
  install -Dm644 ../sshd.pam "$pkgdir"/etc/pam.d/sshd
  install -vDm 644 ../*.hook -t "$pkgdir/usr/share/libalpm/hooks/"

  # factory files
  install -Dm644 ../sshd.pam "$pkgdir"/usr/share/factory/etc/pam.d/sshd
  install -Dm644 "$pkgdir/etc/ssh/moduli" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/ssh_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -Dm644 "$pkgdir/etc/ssh/sshd_config" -t "$pkgdir"/usr/share/factory/etc/ssh/
  install -vDm 644 ../99-archlinux.conf -t "$pkgdir/usr/share/factory/etc/ssh/sshd_config.d/"

  install -vDm 644 ../${_pkgname}.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/0BSD.txt"

  install -Dm755 contrib/findssl.sh -t "$pkgdir"/usr/bin/
  install -Dm755 contrib/ssh-copy-id -t "$pkgdir"/usr/bin/
  install -Dm644 contrib/ssh-copy-id.1 -t "$pkgdir"/usr/share/man/man1/
}

# vim: ts=2 sw=2 et:
