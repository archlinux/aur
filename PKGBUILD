# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
# SELinux Contributor: Zezadas
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname=shadow-selinux
pkgver=4.11.1
pkgrel=3
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=('x86_64' 'aarch64')
url='https://github.com/shadow-maint/shadow'
license=('BSD')
groups=('selinux')
# libcap-ng needed by install scriptlet for 'filecap'
depends=(
  'acl' 'libacl.so'
  'attr' 'libattr.so'
  'audit' 'libaudit.so'
  'glibc'
  'libcap-ng'
  'libxcrypt' 'libcrypt.so'
  'pam-selinux' 'libpam.so' 'libpam_misc.so'
  'libsemanage>=3.2'
)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/{chage,{,ch,chg}passwd,group{add,del,mems,mod},newusers,shadow,user{add,del,mod}}
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
options=('!emptydirs')
install=shadow.install
source=(
  "https://github.com/shadow-maint/shadow/releases/download/v$pkgver/shadow-$pkgver.tar.xz"{,.asc}
  chgpasswd
  chpasswd
  defaults.pam
  newusers
  passwd
  shadow.{timer,service}
  useradd.defaults
  ${pkgname/-selinux}-4.11.1-login.defs.patch
)
sha512sums=('12fbe4d6ac929ad3c21525ed0f1026b5b678ccec9762f2ec7e611d9c180934def506325f2835fb750dd30af035b592f827ff151cd6e4c805aaaf8e01425c279f'
            'SKIP'
            'aef316f283a0ba0387afd5bd049b20d748dcfe8aebc5f5ea1ce1308167d6a578ae7d0007a5ed4d9862de7d377851edd2c8771e1fb1076262468078c2c76e42fc'
            'dc75dfeafa901f9988176b82ef9db5d927dfe687a72ca36ca13ba3e7ac1b0c8055db1104373f2a7ac463e156f079cbc1f0a9f5e6e16b9f74153eb63dcb8f96df'
            '41c856d893c4157b158d79341fe2b1892be463e17f7a007f1c17397b5625c1d2d5671bc0b37879064ae715a918fb9b05c32d18d1aaa64284cddd8ecbda9b2434'
            'dc75dfeafa901f9988176b82ef9db5d927dfe687a72ca36ca13ba3e7ac1b0c8055db1104373f2a7ac463e156f079cbc1f0a9f5e6e16b9f74153eb63dcb8f96df'
            '4fb7474ea9dedf86e4c65bf18f503a6d8c00d477a7c32be3cfdfd026bd62ef866d009c50e5a2dc2101bea332c5697bc1e0d55225f39c83252860f5b9b7461aeb'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '67a49415f676a443f81021bfa29d198462008da1224086f8c549b19c2fd21514ca3302d5ac23edec28b9c724fef921596586423ebe41e852ebfbe7216af727e6'
            'e9ffea021ee4031b9ad3a534bfb94dbf9d0dfd45a55ecac5dedb2453ea0c17fb80bbb9ad039686bc1f3349dc371977eb548e3a665c56531469c22f29fc4eced8'
            'f5f1fad77363db46ca513c76f22654924dd732cdf2e596fcfccb0a47a70d6099b6705e90adb661cd45af076959ef1f9f6bba66942500e603df9421caa9ed2f80')
b2sums=('d459a1e0ffb342b6b455caf65e6af60b32eee72d4a9b1ab126485fb4632503a42061d3f0b960554c8155af6dc0564c585335b27aecca6538b394a0d58d927588'
        'SKIP'
        '31e74eebedf8cb6e5ade36096b4399892d7091b9dce4645fde591f64802dc8befd73ae8019e78f8d326a605b224c7828694d21788bd6073db43c41cf5a9c2805'
        '1518839dbfe12f2f55190976de808515f93eb8c06f1570f02780a5ce8c237e0be43aa7cd0fbbe4c88af1f641586e4d3cf122896d97c7594ef72991e1801ee666'
        '5fde901d7d29995523cf261de973cc053265f37cf8fecc5511ccfff35a6ef4308f8cf36dc94e37c8b7604694ffa6ab87331c9b533b3538c6f7d7d911c9f94d19'
        '1518839dbfe12f2f55190976de808515f93eb8c06f1570f02780a5ce8c237e0be43aa7cd0fbbe4c88af1f641586e4d3cf122896d97c7594ef72991e1801ee666'
        '5b4e20609d38dcec82eae66acdfb7d45288574e7bf9684fa0f66bc0fb1c45cd78ee503d04a5084e28755fb7a1c6cea95854c93b33d76ab20964f45420c68403c'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        '4a9cb6fe6658f2182655d42761d9d669654c6f0e891610e1b7fd256ce32a561f05e71daf8e473d98f16f5ee9d16d46a097a2d0de42eac58b4ce3be1525a74856'
        'd5bea0cfc2e6d3d1749c65440ca911533d41b6f8117fe09e9efec23524637cfa823d230303a7fbb45d3cd251bf8036d48b9b21049ced208f7ed191fcbd75e879'
        'ecc517a22ba12bd7afa3a0eefb68febf27b164cfac6502e66930bd12c62947ae362b4113472544fddc2f39e9c64d78cc662605a359c9988baaba8613d4c0f468')
validpgpkeys=('66D0387DB85D320F8408166DB175CFA98F192AF2')  # Serge Hallyn <sergeh@kernel.org>

prepare() {
  # comment options that are taken over by util-linux and apply defaults
  patch -Np1 -d "${pkgname/-selinux}-$pkgver" -i ../${pkgname/-selinux}-4.11.1-login.defs.patch
}

build() {
  cd "${pkgname/-selinux}-$pkgver"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --disable-account-tools-setuid \
    --with-fcaps \
    --with-libpam \
    --with-group-name-max-length=32 \
    --with-audit \
    --with-bcrypt \
    --with-yescrypt \
    --with-selinux \
    --without-su

  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${pkgname/-selinux}-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C man install

  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  # custom useradd(8) defaults (not provided by upstream)
  install -vDm 600 ../useradd.defaults "$pkgdir/etc/default/useradd"

  # systemd units
  install -vDm 644 "../shadow.timer" -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 "../shadow.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"

  # PAM config - custom
  rm "$pkgdir/etc/pam.d"/*
  install -vDm 644 ../{passwd,chgpasswd,chpasswd,newusers} -t "$pkgdir/etc/pam.d/"

  # PAM config - from tarball
  install -vDm 644 etc/pam.d/groupmems -t "$pkgdir/etc/pam.d/"

  # we use the 'useradd' PAM file for other similar utilities
  for file in chage group{add,del,mod} shadow user{add,del,mod}; do
    install -vDm 644 "../defaults.pam" "$pkgdir/etc/pam.d/$file"
  done

  # Remove evil/broken tools
  rm -v "$pkgdir"/usr/sbin/logoutd

  # Remove utilities provided by util-linux
  rm -v "$pkgdir"/usr/{bin/{login,chsh,chfn,sg,nologin},sbin/{vipw,vigr}}

  # but we keep newgrp, as sg is really an alias to it
  mv -v "$pkgdir"/usr/bin/{newgrp,sg}

  # ...and their many man pages
  find "$pkgdir"/usr/share/man \
      '(' -name 'chsh.1'    -o \
          -name 'chfn.1'    -o \
          -name 'su.1'      -o \
          -name 'logoutd.8' -o \
          -name 'login.1'   -o \
          -name 'nologin.8' -o \
          -name 'vipw.8'    -o \
          -name 'vigr.8'    -o \
          -name 'newgrp.1' ')' \
      -delete

  # move everything else to /usr/bin, because this isn't handled by ./configure
  mv -v "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rmdir -v "$pkgdir/usr/sbin"
}
