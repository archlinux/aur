# Maintainer: Mike Boiko <mike@boiko.ca>

# Dell OpenManage Server Administrator (OMSA) 8.4 for Arch Linux.
# Binary repackage of Dell's official xenial .debs plus an isolated set of
# 2016-era compatibility libraries (vendored under /opt/dell/srvadmin/omsa-compat)
# so the proprietary binaries run on a modern rolling-release system without
# disturbing the host's own libraries.
#
# OMSA 8.4 is the branch that supports 11th-13th generation PowerEdge servers.

pkgbase=omsa8
pkgname=('omsa8' 'omsa8-webserver')
pkgver=8.4.0
pkgrel=2
arch=('x86_64')
url='https://www.dell.com/support/kbdoc/en-us/000177080/dell-emc-systems-management-openmanage-server-administrator'
license=('custom:Dell')
makedepends=('libarchive')
options=('!strip' '!debug' '!emptydirs')

_dell="http://linux.dell.com/repo/community/ubuntu/pool/xenial/openmanage/840/OMSA"
_ubu="http://old-releases.ubuntu.com/ubuntu/pool/main"

# --- Dell OMSA 8.4 instrumentation / CLI debs (proprietary) ---
_base_debs=(
  "$_dell/all/srvadmin-omilcore_8.4.0_all.deb"
  "$_dell/amd64/srvadmin-deng_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-hapi_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-isvc_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-omacore_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-omacs_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-omcommon_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-xmlsup_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-smcommon_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-storage_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-storelib_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-storelib-sysfs_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-storage-cli_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-ominst_8.4.0-1_amd64.deb"
)

# --- Dell OMSA 8.4 web GUI debs (proprietary) ---
_web_debs=(
  "$_dell/amd64/srvadmin-jre_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-tomcat_8.4.0-1_amd64.deb"
  "$_dell/amd64/srvadmin-smweb_8.4.0_amd64.deb"
  "$_dell/amd64/srvadmin-webserver_8.4.0_amd64.deb"
)

# --- 2016-era compat libraries from Ubuntu xenial-era (open source) ---
_compat_debs=(
  "$_ubu/libx/libxml2/libxml2_2.9.4+dfsg1-2.2_amd64.deb"
  "$_ubu/libx/libxslt/libxslt1.1_1.1.28-2build2_amd64.deb"
  "$_ubu/i/icu/libicu57_57.1-4_amd64.deb"
  "$_ubu/libs/libsmbios/libsmbios2_2.2.13-0ubuntu2_amd64.deb"
  "$_ubu/n/ncurses/libncurses5_6.1+20190803-1ubuntu1_amd64.deb"
  "$_ubu/n/ncurses/libtinfo5_6.1+20190803-1ubuntu1_amd64.deb"
)

source=(
  "${_base_debs[@]}"
  "${_web_debs[@]}"
  "${_compat_debs[@]}"
  'dell-openmanage.service'
  'dell-openmanage-web.service'
  'init-functions'
  'omcliproxy-wrapper'
  'omsa-arch-setup.sh'
  'omarolemap'
  'pam-omsa'
  'pam-omauth'
)

noextract=(
  srvadmin-omilcore_8.4.0_all.deb
  srvadmin-deng_8.4.0-1_amd64.deb
  srvadmin-hapi_8.4.0-1_amd64.deb
  srvadmin-isvc_8.4.0-1_amd64.deb
  srvadmin-omacore_8.4.0-1_amd64.deb
  srvadmin-omacs_8.4.0-1_amd64.deb
  srvadmin-omcommon_8.4.0-1_amd64.deb
  srvadmin-xmlsup_8.4.0_amd64.deb
  srvadmin-smcommon_8.4.0_amd64.deb
  srvadmin-storage_8.4.0_amd64.deb
  srvadmin-storelib_8.4.0_amd64.deb
  srvadmin-storelib-sysfs_8.4.0_amd64.deb
  srvadmin-storage-cli_8.4.0_amd64.deb
  srvadmin-ominst_8.4.0-1_amd64.deb
  srvadmin-jre_8.4.0-1_amd64.deb
  srvadmin-tomcat_8.4.0-1_amd64.deb
  srvadmin-smweb_8.4.0_amd64.deb
  srvadmin-webserver_8.4.0_amd64.deb
  libxml2_2.9.4+dfsg1-2.2_amd64.deb
  libxslt1.1_1.1.28-2build2_amd64.deb
  libicu57_57.1-4_amd64.deb
  libsmbios2_2.2.13-0ubuntu2_amd64.deb
  libncurses5_6.1+20190803-1ubuntu1_amd64.deb
  libtinfo5_6.1+20190803-1ubuntu1_amd64.deb
)

b2sums=('df7778d91603a4d43ecd4b4fab38da286e1c0928245f9e4db12eea42e5a203d6d16bd1e29242e3e2cf6d5eb6d7b4ed3fc1887a4d747afc861e8c68d53659327c'
        '727d1a11ff029f85a6682d01e0a11a76f63e1e73736c16f5dde74d0067a8745c5343cd4735c64df9159f5c0e57dec5f96576f959c90d776bae111a0338de6090'
        '7e0f2e3f7ee1b09bedc3205a70b3119f4efec991c3e6bd495515ec62f974ad05b6ec278e476710b008b55e8c15bcfd306f09e4aa697d5357f1bf4eeb49058ad1'
        '4e8faab42c79777a5f65d1165d96e4cdfe691d5376106bd100a54cf9a72254095694a26424f3283d323d16bc73f144aa696bdc1b00b89a6dc825e51d072ea0b1'
        'd1970c0176938612f741f6b487edd47d717fb068e2344231543b113dbafaf08338de83bbf6fd9b6614fd01aa29a7745fa96b6e277d7371d2fd13fed5adc2704f'
        'f3110330f90b3c9fffd60fe316b087d9a3d2b202301732bc0f25f3731d03b497162401ae7bbf619525b647b456be9e4b5029b6bce63048c5ebdd6f23dd246229'
        'dec4010fb25a3b79d155e3c0591f15ce72430091ff400f66063990e8f6c5d8a21cf3d53ac3d4bcb7792e28040a282816c9506fcdcbaf09ccacde92edbdd23fde'
        '55e8e45fcc0de0281f79c7668822bf5159699ceb120343b292a8ef9b4f1353c46d03fdf30b1d1d7227f3eafc9bfa5d025ce21f91da5ddad09f77c1ddfa37c57a'
        '5da15377af5ca9e20dbb03b473fcce1acb747b89b7fba21f31ba53e74b1fee93fa77a378865f57c27206f990d78837e5137f898335930ed4d84964400e90f8e4'
        '21cb6be26f916865a92b4c54c81ce78897e9b6a9ea4022d799d5d0f88686623f60ee51cc1fa168c080820c53f4d008d8fd0fb1a53b9870ab7e718c4a209aefec'
        '7f4efb682f99faad639db660b72956a1d8e995ebe7a42e2ec958a5a08aae1eee83b9f3d74a7aa8a1dbc495d144612a076e61904f02230eb4f1a2ef2fef6f7184'
        'f039e9609abf8b5157c3199b4825488827542e687bf5f800133f15c592bf85d7041e9fa8966f881ef5dc02c397cdac5e59a840fb169469720f282fd440d984f1'
        '28639ae0870032c6b6641896c27f0ebf4139f6185d40d214d1ab815cf93b6b2cd8b8ae8433f1c344558177b1ce85a262f27d39391fb0ce6e0918487fbda210e0'
        'c73b1edea244f53ce3f9f85b75032ed639ce69f6808ceacad4a6f9ce274a53226efa830e79e0b0de59b5d6432b6f5448480e343be88187c8bf82c0ef1f781534'
        '743d7e68dacaca8e30196ec5627480560492cb0046c2ff080f5e9a202b4ac8e4e679b7e46203a5b859cd64a35d2771b3e64c71cb851ab643251ba3a357d4464d'
        '36c69fcc95e69855c8c82cd5faa9b96373d33e0008b5aeb4336e2bb4ec83403796045a4c5d0e6d7b55f8fe296d1876f486ca37e58cf1192e5669a1daa236fdf4'
        'c941f38eee43e8baaec27491278c10d48835a93f56e847a680150f86d062f9fea0a3458b8413d653ff945f7284ea26b21a80d0b19c9e5a5c10b1131c3c3923ad'
        '250886f93c653513ea79de5b94d8e1dca6805ffcfc919b4ac38f080fb11b7ed2c8b8ae59dcc8b1619ecd18d8ec4955dc2da2ced006b27fc81eceff67f54ce49b'
        'f1ad868319947bd37fc7c66a4a88bed2ed61201f7336b2203944abcc5debf105c32581e3831fce175f8f06254a3d148307cad047d7905e0c6df7f16f0b660c3c'
        'ad679423df2b428657eb6a07f96824035f0365c89267f663ba7e999d393f6f0a803ae6c6091531611cd7746898346944ceb95b7611ec6e9c15b4f06720463daf'
        '98ccfce43ca05cde09ef5a2aed97e5cfb6ae48f18d7c1c6caa5911d53ebaf11dcdb3e6c82f0b91631221ba9b20b53b8a8345bbaae58e681c22f0d3ef292a7797'
        'a3b0ea8ce0f92625a0e7ffc41fa7a236aa8496891948f483fe6791b0125bb0985b78fe584ad6a2cd8af07aad4dcc7b65a4ed9db0c31cae1ffeeb2009d4265e28'
        'cf25728c6c4e5ae0c0168fd0c26eac955c9dae70c3a1fadb1162f833bb142d39a523be96deb786f7944f7fa54506045ce6b524fed95a5be7b6526db5434f7574'
        'fdd4b1cafb0e3ab3f2d1b118419df0868cada370eca9c9eaa0cc6429e2a3c90f79547b1fb8d46a19575387977619f42651517999dfdb52fd568ecb8777415832'
        'a8b70f9aa07376bfea98a62afcc1b588632c6c2e98bee8b033fbecddb1749b696581ae49d082800967bfd1ad9fd85bb61eaacecd2a661ae26bb441d606bb8acb'
        'ba64b9968f3e485e806667a1e79da0926fc7bf941c8dfd7aad8d02c93436edee63f638f5bac95e13112257bae47a325e5756ad7ba3aeb7aae6902231ec6f8e6d'
        '1763a9afcafa13fd129417086e3faa1c81af1077a6adfdf037acc83cc2ca2736bd361d43395d4d15f6556a722b3f3eda0b4404b04bd116a623863c5e555b2d2d'
        '8617b53164ada0b7fcf8d7ecad7674521c4e15ab267bb00505cd359be502936dab382f4a53f999d95a672fd8f27d36f92fe81515f7a38ae1c59bf264731c9502'
        'e05a891ab059bcfa8f08ee1e06505b41c7faa4cbf6ffc9c7ccf5fd53524e6004f9c9d886044616bc71a0fea1c10801f88dbeb2fe234cb4ec0a8dbd27bbed7b0f'
        '66a05279632dc9dde6f16ea9316bfd995382187a7120be73e245158d0880e46b61a95967026d21fc7e146faadb4bf26001ec88f266f685f85920b5496219d71e'
        '2cf1e0df0cfe98f24fdf0b9f42eafac5c2809c2b0293ae3e149b7815b997a3ffa9b25312e66d44cc33edc4999418038a5919bf751cf1c91426b1e2abacaab9c8'
        '4891471f7f4e3a70ef20c992394e38584075bf20d13680eb93a79afbcacea8d2ca6345c705ad1885d7714164e2acadc49ce750088c9f7b40a969d473b84644de')

# Extract a .deb's data tree into $2.
_extract_deb() {
  local deb="$srcdir/$(basename "$1")" tmp
  tmp="$(mktemp -d)"
  bsdtar -x -f "$deb" -C "$tmp"
  bsdtar -x -f "$tmp"/data.tar.* -C "$2"
  rm -rf "$tmp"
}

package_omsa8() {
  pkgdesc='Dell OpenManage Server Administrator 8.4 - instrumentation and omreport/omconfig CLI (11G-13G PowerEdge)'
  depends=('openssl-1.0' 'sysfsutils' 'pam' 'glibc' 'gcc-libs')
  optdepends=('omsa8-webserver: web GUI on port 1311')
  install='omsa8.install'

  # 1. Unpack the Dell instrumentation debs.
  local d
  for d in "${_base_debs[@]}"; do _extract_deb "$d" "$pkgdir"; done

  # 2. Vendor the 2016-era compat libraries into an ISOLATED dir (never added to
  #    the global linker cache, so the host's libxml2/libxslt stay untouched).
  local compat="$pkgdir/opt/dell/srvadmin/omsa-compat" stage
  install -d "$compat"
  stage="$(mktemp -d)"
  for d in "${_compat_debs[@]}"; do _extract_deb "$d" "$stage"; done
  find "$stage" -type f \( \
        -name 'libxml2.so.2.*'    -o -name 'libxslt.so.1.*'    -o -name 'libexslt.so.0.*' \
     -o -name 'libicuuc.so.57.*'  -o -name 'libicudata.so.57.*' -o -name 'libicui18n.so.57.*' \
     -o -name 'libsmbios.so.2.*'  -o -name 'libncurses.so.5.*'  -o -name 'libtinfo.so.5.*' \
     \) -exec cp -a '{}' "$compat/" ';'
  rm -rf "$stage"
  ( cd "$compat"
    ln -sf libxml2.so.2.9.4     libxml2.so.2
    ln -sf libxslt.so.1.1.28    libxslt.so.1
    ln -sf libexslt.so.0.8.17   libexslt.so.0
    ln -sf libicuuc.so.57.1     libicuuc.so.57
    ln -sf libicudata.so.57.1   libicudata.so.57
    ln -sf libicui18n.so.57.1   libicui18n.so.57
    ln -sf libsmbios.so.2.1.0   libsmbios.so.2
    ln -sf libncurses.so.5.9    libncurses.so.5
    ln -sf libtinfo.so.5.9      libtinfo.so.5
  )

  # 3. Point both omprv.ini copies' library path at omsa-compat.
  local ini
  for ini in "$pkgdir/opt/dell/srvadmin/etc/openmanage/oma/ini/omprv.ini" \
             "$pkgdir/etc/opt/dell/srvadmin/openmanage/oma/ini/omprv.ini"; do
    [ -f "$ini" ] && sed -i \
      's%^omalibrarypath=%omalibrarypath=/opt/dell/srvadmin/omsa-compat,%' "$ini"
  done

  # 4. Use a PRIVATE LSB init-functions shim (avoids clashing with lsb-release).
  install -Dm644 "$srcdir/init-functions" "$pkgdir/opt/dell/srvadmin/lib/init-functions"
  local s
  for s in dataeng instsvcdrv dsm_sa_ipmi; do
    [ -f "$pkgdir/etc/init.d/$s" ] && sed -i \
      's%/lib/lsb/init-functions%/opt/dell/srvadmin/lib/init-functions%g' \
      "$pkgdir/etc/init.d/$s"
  done

  # 5. Wrap omcliproxy so the CLI gets the vendored libs.
  mv "$pkgdir/opt/dell/srvadmin/sbin/omcliproxy" \
     "$pkgdir/opt/dell/srvadmin/sbin/omcliproxy.bin"
  install -m755 "$srcdir/omcliproxy-wrapper" \
     "$pkgdir/opt/dell/srvadmin/sbin/omcliproxy"

  # 6. Arch glue: setup/register script, role map, PAM, systemd unit.
  install -Dm755 "$srcdir/omsa-arch-setup.sh" "$pkgdir/opt/dell/srvadmin/sbin/omsa-arch-setup.sh"
  install -Dm644 "$srcdir/omarolemap"         "$pkgdir/opt/dell/srvadmin/etc/omarolemap"
  install -Dm644 "$srcdir/pam-omsa"           "$pkgdir/etc/pam.d/omsa"
  install -Dm644 "$srcdir/dell-openmanage.service" \
     "$pkgdir/usr/lib/systemd/system/dell-openmanage.service"

  # 7. License (Dell EULA shipped in the debs).
  local lic
  lic="$(find "$pkgdir/opt/dell/srvadmin" -iname 'license*.txt' -o -iname 'copyright' 2>/dev/null | head -1)"
  if [ -n "$lic" ]; then
    install -Dm644 "$lic" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}

package_omsa8-webserver() {
  pkgdesc='Dell OpenManage Server Administrator 8.4 - web GUI (Tomcat + bundled JRE) on port 1311'
  depends=("omsa8=$pkgver")
  install='omsa8-webserver.install'

  local d
  for d in "${_web_debs[@]}"; do _extract_deb "$d" "$pkgdir"; done

  # Private LSB shim path (the shim itself is provided by omsa8).
  [ -f "$pkgdir/etc/init.d/dsm_om_connsvc" ] && sed -i \
    's%/lib/lsb/init-functions%/opt/dell/srvadmin/lib/init-functions%g' \
    "$pkgdir/etc/init.d/dsm_om_connsvc"

  # Raise the :1311 Tomcat connector's max HTTP header size. Reverse proxies
  # (e.g. Cloudflare) add headers and cookies that overflow Tomcat's 8 KB
  # default, which makes heavier requests return 400 and the web GUI bounce
  # back to the login screen in a redirect loop.
  local _serverxml="$pkgdir/opt/dell/srvadmin/lib64/openmanage/apache-tomcat/conf/server.xml"
  [ -f "$_serverxml" ] && sed -i \
    '/port="1311"/ { /maxHttpHeaderSize/! s/<Connector /<Connector maxHttpHeaderSize="65536" / }' \
    "$_serverxml"

  install -Dm644 "$srcdir/pam-omauth" "$pkgdir/etc/pam.d/omauth"
  install -Dm644 "$srcdir/dell-openmanage-web.service" \
     "$pkgdir/usr/lib/systemd/system/dell-openmanage-web.service"
}
