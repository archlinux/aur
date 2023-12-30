# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Nissar Chababy <funilrys at outlook dot com>
# Contributor: K0n24d <konrad AT knauber DOT net>

set -u
pkgname='urbackup2-client-no-gui'
pkgver=2.5.25
pkgrel='1'
pkgdesc='Client/Server network backup for Windows Workgroups and Linux, headless client'
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url='https://www.urbackup.org/'
license=("GPL")
depends=('crypto++' 'zlib' 'bash' 'openssl' 'device-mapper' 'zstd')
makedepends=('gcc-libs' 'gcc' 'make')
conflicts=(urbackup{,2}-{client,client-no-gui}) #,server})
_verwatch=("${url}/download.html" '//hndl\.urbackup\.org/Client/[0-9\.]\+/urbackup-client-\([0-9\.]\+\)\.tar\.gz' 'l')
_scripts=(
  'btrfs_create_filesystem_snapshot'
  'btrfs_remove_filesystem_snapshot'
  'dattobd_create_filesystem_snapshot'
  'dattobd_remove_filesystem_snapshot'
  'lvm_create_filesystem_snapshot'
  'lvm_remove_filesystem_snapshot'
)
_srcdir="urbackup-client-${pkgver}.0"
source=(
    "https://hndl.urbackup.org/Client/${pkgver}/urbackup-client-${pkgver}.tar.gz"
    "${_scripts[@]}"
    'defaults_client'
    #'0000-md5-bytes.patch'
    '0001-uintptr_t.patch'
    '0002-ClientService-sig.sedpatch'
    '0003-client-version.sedpatch'
)
md5sums=('660887f3a7ae43d8259a73194baf2b07'
         'fcdef7852b3d847c5c2468a619e7fba9'
         'b5f82ed45105f9929e9b98eee8b288fc'
         '5a3c106ff05e9939902272c936b653eb'
         'b001546cc988ac8ea8646c9e1438316b'
         'e17da398a0d4074a3aae23c46d93db0b'
         'b8972631f9633b24b711bc831c972d42'
         'b3442a7228cbb9ce56da85ba219ad925'
         'beb7f4062a60ddae07d4090e7b38c0e4'
         'e02f751bfba1999240be3822acf8252b'
         'cc6bc607ab6d61adb0e8d946bc74342b')
sha256sums=('100e10e1d952757f2f542695fcd77c05f849a32f0dfa5335cbfbeb8b70938c38'
            '18b5eceb73086b86d904f80e9270df121d06d7c683f93c5449a82e7deb38e0ee'
            '334d9eb67a642d96e04874fd27c1b57d578c35b4cdc768d50db7ac2436f0927c'
            '869e6244efbf6e370938e2e5c94a16c0130f583815ddbd34802578656989048b'
            '23d6bdad352d33fe41acd50e0114f986cd4324c2c65ca16cea365cb99d90addd'
            'd5b462879e7c80139688c9d20ce1b1fe553386df9459def5e1d093d3a13d71fb'
            '0ffb3bbbf5faf939564681d24786767a4706132f2f081b7a870ecc718a8e9413'
            'd77fa6ad67141ae5cb4c3c6953783ce54aaaa3c1f2fe5bb28cd20948ddda12c4'
            '9d6389ed971b8ef13ebdc327e47a2e9e2988b6fe0bffab5191e29b5f507941d4'
            '7ce91c4df9ba36ff7f057cad098aae097d2cd09c1e449772638699b411a42bde'
            '20dd313729e3fd386a566c789137a8ae49b26a80702bd04363e2694a6c6cf6fa')
sha512sums=('ff52d871af884baccaebcb5dcbdb83c2118bce2a9fe8b89b531ac2f86f948760d07b0b4f718003c05b965c9e06de2fcadaf88db3808e593093f133405bb37d7c'
            '416fb8f5f3687a3c369cc2b199d4c8b4170494f0a119566a91ac6a0c2f202dc5049804c10508b66ba657011b39be5ddd055091cd531a665b4398899f404086ca'
            '860021ce5b8d92ff58e8286991162c7bab45493c3b9c87577a43764f6b416397448bb99b8fcb850c4c5853927cb0a8637792b75ff53ee7ee257da3f5d29ae3a7'
            'fde5912b589a495dc03a26d174d7673ff746eed34d6b1ed64758b2dc2ec2ec53e02e6a28b04734a7112f16687b31d25123e99dbc69e9dcab48773675382ec582'
            'a8b58bba1b8b0a6b70395f9fe4277eeee60a0ba534f4eddb999d719915c76b76facb54172e03b7b29b9f725a4d720e9b676b05e5081f7528570956e903fe59bd'
            'a2d4ba03ae15582d2cd74ff68c38ff0f90d75a6eb5c241f9a022b0652fa2dc9b184439f6bda9a9538645925f739503ee7b3fc7bb232589583cdeb6dc27d74e5c'
            '9bdfefccdd9d6e37a77975324a7c417f3de2aa59e6da0bfde3c318b8c6f3d7f4629f3a41eebee548b9c572b8ed39640434cc08bd020d25362fddffc4426438de'
            '238c286d451474a8721292f7e98b4f13600cb430c16a27ceb9551cc83705b8268a3f1202785fb5b61523f372b4e7e804fd20b7db62677621983d79a271aa106b'
            '99d8d11d1a9b4f85f464fb30f17f0d4775e6852deceedc1e82ae49a37d62241b8502002bef0b459f3dd2d1b40903961ffb7351295bd487db3218bc5428f19001'
            '6512cb8fd87ce7bb6254572d4065f622dcc3494eb95ea52d7cb6efc2689a9bb2091e9cf58946c1840d7aafde9ae49e3648d13bc972dfeb92a288775172a09e0d'
            'c78e0b57fe7b1a38a7c4cfb62be40fc276c2524faa341611efb182d6e004b5d3e75f4fd710cbf6cf4e92049348e8c43d2b0f44a5d9ee3f6e21ee83e73b0dda59')

# These allow server and client to be installed on the same machine
_oldsig='urbackup_ecdsa409k1.pub'
_newsig='urbackup_client_ecdsa409k1.pub'
_oldver='version.txt'
_newver='version_client.txt'

prepare() {
  set -u
  cd "${_srcdir}"

  local _fa
  readarray -t _fa < <(grep --include '*.c*' --include '*.h*' --include '*.dat' --include '*.txt' --include '*.m4' -lre $'\r' .)
  sed -e 's:\r$::g' -i "${_fa[@]}"
  #grep -lr $'\r' .; false
  local _seds=(
    -e "s:@OLDSIG@:${_oldsig}:g"
    -e "s:@NEWSIG@:${_newsig}:g"
    -e "s:@OLDVER@:${_oldver}:g"
    -e "s:@NEWVER@:${_newver}:g"
  )
  local _f
  for _f in "${source[@]}"; do
    if [[ "${_f}" = *.patch ]]; then
      set +u; msg2 "patch ${_f}"; set -u
      patch -Nup1 -i "${srcdir}/${_f}"
    elif [[ "${_f}" = *.sedpatch ]]; then
      set +u; msg2 "sed patch ${_f}"; set -u
      patch -Nup1 -i <(sed -E "${_seds[@]}" "${srcdir}/${_f}")
    fi
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > '0000-new.patch'

  #sed -e "s:\"${_oldsig}\":\"${_newsig}\":g" -i 'urbackupclient/ClientService.cpp'
  #sed -e "s:\"${_oldver}\":\"${_newver}\":g" -i 'client/main.cpp' 'client/Info.cpp' 'urbackupclient/ClientServiceCMD.cpp' 'urbackupclient/ClientService.cpp'

  #sed -e 's:byte digest:unsigned char digest:g' -i 'md5.h'

  #sed -E -e 's/std::auto_ptr/std::unique_ptr/g' -i $(grep --include '*.c*' --include '*.h*' -lre 'std::auto_ptr')
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    CFLAGS="${CFLAGS/-march=x86-64/-march=native}"
    CXXFLAGS="${CXXFLAGS/-march=x86-64/-march=native}"
    CXXFLAGS+=' -ansi -std=gnu++11'
    #CPPFLAGS+=' -DNDEBUG'
    local _conf=(
      --prefix='/usr'
      --sbindir='/usr/bin'
      --localstatedir='/var'
      --sysconfdir='/etc'
      --enable-headless
       --enable-embedded-cryptopp
    )
    ./configure "${_conf[@]}"
  fi
  nice make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  make -s -j1 DESTDIR="${pkgdir}" install

  install -Dpm644 <(sed -e 's:/usr/local/sbin/:/usr/bin/:g' 'urbackupclientbackend-debian.service') "${pkgdir}/usr/lib/systemd/system/urbackupclientbackend.service"
  install -Dpm644 'docs/urbackupclientbackend.1' -t "${pkgdir}/usr/share/man/man1/"

  cd "${srcdir}"
  install -Dpm644 'defaults_client' "${pkgdir}/etc/default/urbackupclient"
  install -Dpm700 "${_scripts[@]}" -t "${pkgdir}/usr/share/urbackup/"

  mv "${pkgdir}/usr/share/urbackup/${_oldsig}" "${pkgdir}/usr/share/urbackup/${_newsig}"
  mv "${pkgdir}/var/urbackup/${_oldver}" "${pkgdir}/var/urbackup/${_newver}"
  set +u
}
set +u
# vim: ts=2
