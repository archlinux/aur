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
pkgver=4.12.3
pkgrel=2
pkgdesc="Password and account management tool suite with support for shadow files and PAM - SELinux support"
arch=(x86_64 aarch64)
url="https://github.com/shadow-maint/shadow"
license=(BSD)
groups=(selinux)
depends=(
  acl libacl.so
  attr libattr.so
  audit libaudit.so
  glibc
  libxcrypt libcrypt.so
  pam-selinux libpam.so libpam_misc.so
  'libsemanage>=3.2'
)
makedepends=(docbook-xsl itstool libcap libxslt)
backup=(
  etc/default/useradd
  etc/login.defs
  etc/pam.d/{chage,{,ch,chg}passwd,group{add,del,mems,mod},newusers,shadow,user{add,del,mod}}
)
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
options=(!emptydirs)
# NOTE: distribution patches are taken from https://gitlab.archlinux.org/archlinux/packaging/upstream/shadow/-/commits/v4.12.3.arch2
source=(
  https://github.com/shadow-maint/shadow/releases/download/$pkgver/shadow-$pkgver.tar.xz{,.asc}
  0001-Disable-replaced-tools-and-man-pages.patch
  0002-Adapt-login.defs-for-PAM-and-util-linux.patch
  0003-Add-Arch-Linux-defaults-for-login.defs.patch
  0004-Add-Arch-Linux-defaults-for-etc-pam.d.patch
  shadow.{timer,service}
  useradd.defaults
)
sha512sums=('0529889258f54e7634762dc154aa680d55f8c5f1654afadd1b7431cfbb890a3b1ba27c7ff4b7c45986e4ee2289946db2e420b23ed13e4e5b15800a1fb3a013bc'
            'SKIP'
            'a0c69c252a8e41b1e3aa4c76cc6c37893a667dd079db9b7bdb54143d4b81f56551b787a93dad6e4adcd532cd12b51c9a5a5a4ae509f7ab5fe732fb9f23f57b5c'
            'a44f3d71376a39bc7bb9d43290f619964f83184dba938857f5765c439150df2c9ba00f115579a7eeca5b316ea71808e9606c6ba977a41aa7fc4b1675606f1351'
            'e8418e6d518101be63e7890254f9a0490f94302882689a0b69601186c9f1915831a34bb6998dbc92b753bff3f762793a7ccade66c2bac2d7b7a77d1a861d5cb7'
            '4e6b1f88ab1e3416ab0633b897ebb1359d422b5c2222f3ed3631732f790c42352d1cbe66fa08f45eb2e1679af8f602a95fcc7f463f1bba94c2414e902a4fa215'
            'e4edf705dd04e088c6b561713eaa1afeb92f42ac13722bff037aede6ac5ad7d4d00828cfb677f7b1ff048db8b6788238c1ab6a71dfcfd3e02ef6cb78ae09a621'
            '86c9412e379c0fc97c0eec417340adae990342f35d6663a6a59e8aae2221a5fbfd0437b5892aefd9cf09ef76a970f3a42b20cea051db651475d526eda17a973a'
            'e9ffea021ee4031b9ad3a534bfb94dbf9d0dfd45a55ecac5dedb2453ea0c17fb80bbb9ad039686bc1f3349dc371977eb548e3a665c56531469c22f29fc4eced8')
b2sums=('63b10d75a11d419156a996b8acf1bebbfab28999c2ab796e6625c028882073d4021806d8b56224190886c076a1205955e7797cb6f797ef73af3a8a33ac34bf2f'
        'SKIP'
        'f1bf37abe10f554abea4635c62e74c43e09e64181e83d68dd8e2031d44d3a46835c5b4997b04614115a2dbd51a1caa67f7ca70fed623ee7f2916538a8ac85593'
        'a1cd3ffd50335eee265587a6a8733bc4c6b0d354c6ea90b2dd5d42642d782acc00d690a40e71ba31b56fd374b1619cc05f9dc876b2f6279ff32f95a17bbbbd87'
        '9715184569ca6769b31c01a58a1c8a0b5bb8099f6c07a888a2e0fab6748ac18eed7dd4297cc98449fd2a123cff6b027ab757d34a4cad113a4d9e5e02b28bb668'
        'f11abd5dbe0cc4029eb8e7eb101d95f0fbf48550bdab73ebea1f25a5bc9a401713061832bf494d614711d834ab1e79ef14831bc8a2d18b8980fcb2fe7e0fe5c3'
        '5cfc936555aa2b2e15f8830ff83764dad6e11a80e2a102c5f2bd3b7c83db22a5457a3afdd182e3648c9d7d5bca90fa550f59576d0ac47a11a31dfb636cb18f2b'
        'be9d8a7424143791e61d61b01c775e3a10dd6b6a1a7af13081bc00e400e880a209240dcceb09c671de41fbdf18373f1195aa8a559cf935122ba5d1312ed8dab2'
        'd5bea0cfc2e6d3d1749c65440ca911533d41b6f8117fe09e9efec23524637cfa823d230303a7fbb45d3cd251bf8036d48b9b21049ced208f7ed191fcbd75e879')
validpgpkeys=(66D0387DB85D320F8408166DB175CFA98F192AF2)  # Serge Hallyn <sergeh@kernel.org>

prepare() {
  local filename

  cd "${pkgname/-selinux}-$pkgver"
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      printf "Applying patch %s\n" "${filename##*/}"
      patch -Np1 -i "$srcdir/${filename##*/}"
    fi
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --bindir=/usr/bin
    --sbindir=/usr/bin
    --libdir=/usr/lib
    --mandir=/usr/share/man
    --sysconfdir=/etc
    --disable-account-tools-setuid
    --enable-man
    --with-fcaps
    --with-libpam
    --with-group-name-max-length=32
    --with-audit
    --with-bcrypt
    --with-yescrypt
    --with-selinux
    --without-su
  )

  cd "${pkgname/-selinux}-$pkgver"
  ./configure "${configure_options[@]}"

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
  install -vDm 644 ../shadow.timer -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../shadow.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vdm 755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
  ln -s ../shadow.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/shadow.timer"
}
