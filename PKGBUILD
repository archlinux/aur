# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

############################################################################
# Patch VMware Workstation to enable macOS guests support
# Uncomment the line below to enable it

#_enable_macOS_guests=y

# CAUTION: Run macOS on a non Apple computer may be forbidden in your country.
# Source of the patch: https://github.com/DrDonk/unlocker
# Forum: http://www.insanelymac.com/forum/topic/303311-workstation-1112-player-712-fusion-78-and-esxi-6-mac-os-x-unlocker-2
############################################################################

#PKGEXT=.pkg.tar
pkgname=vmware-workstation
pkgver=12.5.7_5813279
pkgrel=1
pkgdesc='The industry standard for running multiple operating systems as virtual machines on a single Linux PC.'
arch=(x86_64)
url='https://www.vmware.com/products/workstation-for-linux.html'
license=(custom)
install="vmware-workstation.install"
conflicts=(
  vmware-modules-dkms
  vmware-ovftool
  vmware-patch
  vmware-systemd-services
)
provides=(
  vmware-ovftool
)
depends=(
  dkms
  hicolor-icon-theme
  # needed to replace internal libs:
  fontconfig
  freetype2
  zlib
)
optdepends=(
  'linux-headers: build modules against Arch kernel'
)
makedepends=(
  sqlite
)
backup=(
  'etc/vmware/config'
  'etc/vmware/hostd/authorization.xml'
  'etc/vmware/hostd/config.xml'
  'etc/vmware/hostd/datastores.xml'
  'etc/vmware/hostd/dispatcher.xml'
  'etc/vmware/hostd/environments.xml'
  'etc/vmware/hostd/proxy.xml'
  'etc/vmware/hostd/tagExtractor.xml'
  'etc/vmware/netmap.conf'
  'etc/vmware/ssl/hostd.ssl.config'
  'etc/pam.d/vmware-authd'
)
source=(
  "https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-${pkgver/_/-}.${CARCH}.bundle"

  'bootstrap'
  'config'
  'pam.d-vmware-authd'
  'configure-initscript.sh'

  'config.xml'
  'datastores.xml'
  'environments.xml'
  'proxy.xml'

  'vmware-hostd-certificates.service'
  'vmware-hostd.service'
  'vmware-networks-configuration.service'
  'vmware-networks.service'
  'vmware-usbarbitrator.service'

  'dkms.conf'
  'Makefile'
  'vmblock.patch'
  'vmci.patch'
  'vmmon.patch'
  'vmnet.patch'
  'vsock.patch'
)
sha256sums=(
  '82178c109f987bb6740171572516f533a725f3563a26d628c769a88bcd4a84f7'

  '12e7b16abf8d7e858532edabb8868919c678063c566a6535855b194aac72d55e'
  '55af509a4328fa88518e7008c65ff5598e6007e99ca2b4421a8f9b26126f6ff3'
  'd50aa0a3fe94025178965d988e18d41eb60aa1ce2b28ee6e3ca15edeabfa2ca7'
  '8e4d08668a66be79a900521792b39c16a026cc90659241edee80b64e701bfbcd'

  'd0806b6cb99af04232585def7b8043df3104b9b17470ea70abbd5bedc1e7ca16'
  '434cd4aa440d36b75ee20e0b588aaad874bb0d796173990bc4046667c66f5099'
  '25c5aa39489d14a60f9cb30bdd7b21d36399c3355daee8bf5fbebcb62fe9f45f'
  '3c802523606184a5e8ebbe931d9c6c70d83ff8c6833b9f48aa264f0bd5a18a88'

  'f9440479f3ae5ad0a39bba3150276627878bf83d6879444fb327c53a1dbb5a4d'
  '70301aa4eff4f42d7d39b276445dc7d8f44b8a0e184775e8a9e3055bb9d8590a'
  'e3812b78158672c7d96b6a58877681462f3fbdfe99a948b32c80c755c8682450'
  'f9297948eba55fbaa6c9d1846b92070f27fda17afe78b41ed0e4c2eaa452b56c'
  'd7a9fbf39a0345ae2f14f7f389f30b1110f605d187e0c241e99bbb18993c250d'

  '71339774bf2b962735013e8683d80591a7cf073607cc992f94b75207f3337485'
  '3a62d45f046b22d1fba9c34db42d8b2774b084f82356b9f18f05bd2cef214ace'
  '7a321d06f9caeb69015bb1fe6cbc8c7113365589b64f18344b12f92fa21e7ebd'
  'e37923167e181f57be4eeec1adba27a42d0d2240ece6b29aca44a61708ca16dd'
  '4339a98bd5aba421bc1043f2ee97ea00b082733c81bce321edc7bc72e16ce09b'
  'c2eba38cc99534675e3c114ecf68cbb65cb14b3d52c95ff17dbf1273fc289947'
  'd7e6b21fef94b4d3fe655a68c20a9556a718a252826a899fb46c4f2475046954'
)
options=(!strip emptydirs)


_isoimages=(freebsd linux linuxPreGlibc25 netware solaris windows winPre2k winPreVista)

if [ -n "$_enable_macOS_guests" ]; then

_vmware_fusion_ver=8.5.8_5824040
# List of VMware Fusion versions: https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/

makedepends+=(
  python2
  unzip
)

source+=(
  "https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/${_vmware_fusion_ver/_//}/packages/com.vmware.fusion.tools.darwinPre15.zip.tar"
  "https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/${_vmware_fusion_ver/_//}/packages/com.vmware.fusion.tools.darwin.zip.tar"
  'unlocker.py'
)
sha256sums+=(
  '01b187cb9a951190eda545e5d0235a98b0018f50942b4485844b627c3617d8d2'
  '86702271b192c6116dbfe107206b10c0ab39d10cbbfcb53756dc09009f54f765'
  '2ad5c0e7a31d7c2009e449fe16acfd5a9036b9d69258be82004cbd0ee41b42cf'
)

_fusion_isoimages=(darwin darwinPre15)
fi


_create_database_file() {
  # Create a database which contains the list of guest tools (necessary to avoid that vmware try to download them)
  local database_filename="$pkgdir/etc/vmware-installer/database"
  echo -n "" > $database_filename

  sqlite3 $database_filename "CREATE TABLE settings(key VARCHAR PRIMARY KEY, value VARCHAR NOT NULL, component_name VARCHAR NOT NULL);"
  sqlite3 $database_filename "INSERT INTO settings(key,value,component_name) VALUES('db.schemaVersion','2','vmware-installer');"
  sqlite3 $database_filename "CREATE TABLE components(id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, version VARCHAR NOT NULL, buildNumber INTEGER NOT NULL, component_core_id INTEGER NOT NULL, longName VARCHAR NOT NULL, description VARCHAR, type INTEGER NOT NULL);"

  for isoimage in ${_isoimages[@]}
  do
	local version=$(cat "$srcdir/extracted/vmware-tools-$isoimage/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")
	sqlite3 $database_filename "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"$version\",\"${pkgver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
	sqlite3 $database_filename "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"0\",\"${_vmware_fusion_ver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done
fi
}

prepare() {
  extracted_dir="$srcdir/extracted"
  [[ -d "$extracted_dir" ]] && rm -r "$extracted_dir"

  bash \
    "$(readlink -f "$srcdir/VMware-Workstation-Full-${pkgver/_/-}.${CARCH}.bundle")" \
    --extract "$extracted_dir"

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
    unzip -q com.vmware.fusion.tools.$isoimage.zip
    rm manifest.plist
  done

  sed -i -e "s/vmx_path = '/vmx_path = '${pkgdir//\//\\/}/" \
      -i -e "s/vmwarebase = '/vmwarebase = '${pkgdir//\//\\/}/" \
      -i -e "s/vmx_version = .*$/vmx_version = 'VMware Player ${pkgver/_/ build-}'/" "$srcdir/unlocker.py"
fi
}

package() {
  # Make directories and copy files.

  mkdir -p \
    "$pkgdir/etc"/{cups,pam.d,modprobe.d,profile.d,thnuclnt,vmware} \
    "$pkgdir/usr"/{share,bin} \
    "$pkgdir/usr/include/vmware-vix" \
    "$pkgdir/usr/lib"/{vmware/setup,vmware-vix,vmware-ovftool,vmware-installer/2.1.0,cups/filter,modules-load.d} \
    "$pkgdir/usr/share"/{doc/vmware-vix,licenses/"$pkgname"} \
    "$pkgdir/var/lib/vmware/Shared VMs"

  cd "$srcdir/extracted"

  cp -r \
    vmware-workstation/share/* \
    vmware-workstation/man \
    vmware-network-editor-ui/share/* \
    vmware-player-app/share/* \
    "$pkgdir/usr/share"

  cp -r \
    vmware-workstation/bin/* \
    vmware-vmx/{,s}bin/* \
    vmware-vix-core/bin/* \
    vmware-vprobe/bin/* \
    vmware-workstation-server/{vmware-hostd,vmware-vim-cmd,vmware-wssc-adminTool} \
    vmware-network-editor-ui/bin/* \
    vmware-player-app/bin/* \
    "$pkgdir/usr/bin"

  cp -r \
    vmware-workstation/lib/* \
    vmware-player-app/lib/* \
    vmware-vmx/lib/* \
    vmware-vprobe/lib/* \
    vmware-workstation-server/{bin,lib,hostd} \
    vmware-usbarbitrator/bin \
    vmware-network-editor/lib \
    "$pkgdir/usr/lib/vmware"

  cp -r \
    vmware-player-setup/vmware-config \
    "$pkgdir/usr/lib/vmware/setup"

  cp -rL \
    vmware-workstation-server/config/etc/vmware/* \
    vmware-workstation-server/etc/vmware/* \
    "$srcdir"/{bootstrap,config} \
    "$pkgdir/etc/vmware"

  cp -r \
    vmware-vix-lib-Workstation1200/lib/Workstation-12.0.0 \
    vmware-vix-core/{lib/*,vixwrapper-config.txt} \
    "$pkgdir/usr/lib/vmware-vix"
  cp vmware-vix-core/vix-perl.tar.nogz "$pkgdir/usr/lib/vmware-vix/vix-perl.tar.gz"

  cp -r \
    vmware-vix-core/doc/* \
    "$pkgdir/usr/share/doc/vmware-vix"

  cp -r \
    vmware-ovftool/* \
    "$pkgdir/usr/lib/vmware-ovftool"

  cp -r \
    vmware-installer/{python,sopython,vmis,vmis-launcher,vmware-installer,vmware-installer.py} \
    "$pkgdir/usr/lib/vmware-installer/2.1.0"

  cp -r \
    vmware-player-app/etc/cups/* \
    "$pkgdir/etc/cups"

  cp -r \
    vmware-player-app/extras/thnucups \
    "$pkgdir/usr/lib/cups/filter"

  cp -r \
    vmware-vix-core/include/* \
    "$pkgdir/usr/include/vmware-vix"

  for isoimage in ${_isoimages[@]}
  do
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso.sig" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso.sig"
  done

  install -Dm 644 "vmware-player-app/doc/LearnMore.txt" "$pkgdir/usr/share/licenses/$pkgname/Privacy.txt"
  install -Dm 644 "vmware-workstation/doc/EULA" "$pkgdir/usr/share/licenses/$pkgname/VMware Workstation - EULA.txt"
  install -Dm 644 "vmware-workstation/doc"/*open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/lib/vmware-ovftool/vmware.eula" "$pkgdir/usr/share/licenses/$pkgname/VMware OVF Tool component for Linux - EULA.txt"
  rm "$pkgdir/usr/lib/vmware-ovftool"/{vmware-eula.rtf,open_source_licenses.txt,manifest.xml}

  install -Dm 755 "$srcdir/configure-initscript.sh" "$pkgdir/usr/lib/vmware-installer/2.1.0/bin/configure-initscript.sh"

  install -Dm 644 "vmware-vmx/etc/modprobe.d/modprobe-vmware-fuse.conf" "$pkgdir/etc/modprobe.d/vmware-fuse.conf"

  install -Dm 644 vmware-player-app/lib/isoimages/tools-key.pub "$pkgdir/usr/lib/vmware/isoimages/tools-key.pub"

  install -Dm 644 vmware-vmx/extra/modules.xml "$pkgdir/usr/lib/vmware/modules/modules.xml"
  install -Dm 644 vmware-installer/bootstrap "$pkgdir/etc/vmware-installer/bootstrap"

  for hostd_file in config datastores environments proxy; do
    install -Dm 644 "$srcdir/$hostd_file.xml" "$pkgdir/etc/vmware/hostd/$hostd_file.xml"
  done

  install -Dm 644 "$srcdir/pam.d-vmware-authd" "$pkgdir/etc/pam.d/vmware-authd"

  echo -e "vmci\nvmmon" > "$pkgdir/usr/lib/modules-load.d/vmware.conf"

  for service_file in \
    vmware-hostd-certificates.service \
    vmware-hostd.service \
    vmware-networks-configuration.service \
    vmware-networks.service \
    vmware-usbarbitrator.service
  do
    install -Dm 644 \
      "$srcdir/$service_file" \
      "$pkgdir/usr/lib/systemd/system/$service_file"
  done


  # Apply permissions where necessary.

  chmod +x \
    "$pkgdir/usr/bin"/* \
    "$pkgdir/usr/lib/vmware/bin"/* \
    "$pkgdir/usr/lib/vmware/setup"/* \
    "$pkgdir/usr/lib/vmware/lib"/{wrapper-gtk24.sh,libgksu2.so.0/gksu-run-helper} \
    "$pkgdir/usr/lib/vmware-ovftool"/{ovftool,ovftool.bin} \
    "$pkgdir/usr/lib/vmware-installer/2.1.0"/{vmware-installer,vmis-launcher} \
    "$pkgdir/usr/lib/cups/filter"/* \
    "$pkgdir/usr/lib/vmware-vix/setup"/*

  chmod -R 600 "$pkgdir/etc/vmware/ssl"
  chmod +s \
    "$pkgdir/usr/bin"/{vmware-authd,vmware-mount} \
    "$pkgdir/usr/lib/vmware/bin"/{vmware-vmx,vmware-vmx-debug,vmware-vmx-stats}


  # Add symlinks the installer would create.

  for link in \
    licenseTool \
    thnuclnt \
    vmplayer \
    vmware \
    vmware-app-control \
    vmware-enter-serial \
    vmware-fuseUI \
    vmware-gksu \
    vmware-modconfig \
    vmware-modconfig-console \
    vmware-netcfg \
    vmware-tray \
    vmware-unity-helper \
    vmware-vmblock-fuse \
    vmware-zenity
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/lib/vmware/bin/$link"
  done

  ln -s /usr/lib/vmware/icu "$pkgdir/etc/vmware/icu"
  ln -s /usr/lib/vmware-ovftool/ovftool "$pkgdir/usr/bin/ovftool"
  ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/etc/thnuclnt/.thnumod"


  # Replace placeholder "variables" with real paths.

  for file in \
    pango/pangorc \
    pango/pango.modules \
    pango/pangox.aliases \
    gtk-2.0/gdk-pixbuf.loaders \
    gtk-2.0/gtk.immodules
  do
    sed -i 's,@@LIBCONF_DIR@@,/usr/lib/vmware/libconf,g' "$pkgdir/usr/lib/vmware/libconf/etc/$file"
  done

  sed -i 's,@@BINARY@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmware-netcfg,' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"
  sed -i 's,@@VMWARE_INSTALLER@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmplayer,' "$pkgdir/usr/share/applications/vmware-player.desktop"

  sed -i 's,@@AUTHD_PORT@@,902,' "$pkgdir/usr/lib/vmware/hostd/docroot/client/clients.xml"

  sed \
    -e 's/@@VERSION@@/2.1.0/' \
    -e 's,@@VMWARE_INSTALLER@@,/usr/lib/vmware-installer/2.1.0,' \
    -i "$pkgdir/etc/vmware-installer/bootstrap"


  # Patch up the VMware kernel sources and configure DKMS.

  dkms_dir="$pkgdir/usr/src/$pkgname-$pkgver"

  install -Dm 644 "$srcdir/Makefile" "$dkms_dir/Makefile"
  install -Dm 644 "$srcdir/dkms.conf" "$dkms_dir/dkms.conf"

  sed \
    -e "s/@PKGNAME@/$pkgname/g" \
    -e "s/@PKGVER@/$pkgver/g" \
    -i "$dkms_dir/dkms.conf"

  find vmware-vmx/lib/modules/source -mindepth 1 -exec bsdtar -xf {} -C "$dkms_dir" \;
  rm -r "$pkgdir/usr/lib/vmware/modules/source"

  for module in vmblock vmci vmmon vmnet vsock; do
    msg "Patching $module module for DKMS"
    patch -p2 --read-only=ignore --directory="$dkms_dir/$module-only" < "$srcdir/$module.patch"
  done

if [ -n "$_enable_macOS_guests" ]; then
  msg "Patching VMware for macOS guest support"
  python2 "$srcdir/unlocker.py" > /dev/null

  for isoimage in ${_fusion_isoimages[@]}
  do
    install -Dm 644 "$srcdir/payload/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
    install -Dm 644 "$srcdir/payload/$isoimage.iso.sig" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso.sig"
  done
fi

  _create_database_file

  # use system font rendering
  ln -sf /usr/lib/libfreetype.so.6 "$pkgdir/usr/lib/vmware/lib/libfreetype.so.6/"

  # to solve bugs with incompatibles library versions:
  ln -sf /usr/lib/libz.so.1 "$pkgdir/usr/lib/vmware/lib/libz.so.1/"
  # if there is not a better solution, define environment variable VMWARE_USE_SHIPPED_LIBS
  echo -e "#export VMWARE_USE_SHIPPED_LIBS=yes" > "$pkgdir/etc/profile.d/vmware.sh"
  chmod 755 "$pkgdir/etc/profile.d/vmware.sh"
  ln -sf /usr/lib/libfontconfig.so.1 "$pkgdir/usr/lib/vmware/lib/libfontconfig.so.1/" # avoid a conflict with fontconfig when VMWARE_USE_SHIPPED_LIBS is defined
}
