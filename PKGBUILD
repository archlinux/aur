# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_opl_url="https://github.com/ps2homebrew/Open-PS2-Loader"
_opl_ver="1.1.0"
_opl_name="OPNPS2LD"
_pops_url="https://github.com/AnimMouse/POPS-binaries"
_pops_commit="c63de15"
_popstarter_name="POPStarter_SMB_Quickstarter_Pack_20200209"
_popstarter_smb="https://bitbucket.org/ShaolinAssassin/popstarter-documentation-stuff/downloads/$_popstarter_name.zip"

pkgname=pops-usb-setup
pkgver=0.0.1
pkgrel=5
pkgdesc="Setup a USB drive for the POPS emulator"
arch=('x86_64' 'i686' 'pentium4')
url="https://gitlab.com/tallero/pops-usb-setup"
license=('AGPL3')
depends=('python')
makedepends=('git' 'p7zip' 'python-setuptools')
options=(!strip)
source=("git+$url"
        "git+$_pops_url#commit=$_pops_commit"
        "$_opl_url/releases/download/v$_opl_ver/$_opl_name.7z"
        "https://archive.org/download/pops-iox/POPSTARTER.ELF"
        "https://archive.org/download/pops-iox/POPS_IOX.PAK"
        "$_popstarter_smb")
sha512sums=(SKIP
            SKIP
            e39a5537f8bfd5fcc9964f1d20302a02f5936c3bd5154db61b85aa16d9182a83f70135c4782ef38ca1120137c2c19c508587d3a7e69016008f2c77dca44ac50b
            2449bc74620434e8ef6e6bf0f564957b0ba80a9ea53d15a3245e2873367f61d8e0d0670f04003c3dc6d778c6a540be35570052d6f8ccd7201e6dbf6b4600ba9e
            d171b51f19080f1dcbd25acdd3c8695014352472dd2a164b6053bfe8bb52741ef35e1852a244ba18c018a79eecd26ce185fc9d67bde85f32f48a7fdca01bf751
           SKIP)

package() {

  module_dir="$srcdir/$pkgname/pops_usb_setup"

  mv $srcdir/$_opl_name/$_opl_name-v$_opl_ver.ELF \
     $module_dir/opl/$_opl_name.ELF

  mv $srcdir/POPS-binaries/* \
     $module_dir/usb/bitbucket

  mv $srcdir/POPS_IOX.PAK \
     $module_dir/usb/archive

  mv $srcdir/POPSTARTER.ELF \
     $module_dir/usb/archive

  mv $srcdir/$_popstarter_name/network_modules/* \
     $module_dir/smb/

  cd $pkgname

  python3 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
