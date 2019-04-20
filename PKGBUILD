_pkgname="xamarin-android"
pkgname=("${_pkgname}-git")
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages such as C#. (git version)"
pkgver=0
pkgrel=0
arch=('x86_64')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
depends=(
	'mono>=5.18'
	'java-environment=8'
	# these should be reused, but it looks like makefile doesn't care
	#'android-ndk' 'android-sdk'
 	#"android-platform-"{} 
	#"android-x86-64-system-image-"{}
	#'android-support-repository'
	#'apache-ant'
	#base-devel: autoconf (autotools)
	)
makedepends=(
	'git'
	'cmake' 'gdk-pixbuf2' 'wget' 'msbuild'
	'lsb-release' 'openssh'
	# these should be also reused, but the same happens
	#'llvm' 'nuget'
	)
_android_repo='https://dl.google.com/android/repository'
_apache_repo='https://archive.apache.org/dist/ant/binaries'
_ndk="android-ndk-r${_ndk_ver}-linux-x86_64"
_build_ver='28.0.3'
_plat_ver='28.0.2'
_emu_ver='5395263'
_cmake_ver='3.10.2'
source=(
	"${_pkgname}::git+${url}.git"
	'ext_debugger-libs::git+git://github.com/mono/debugger-libs.git'
	'ext_dlfcn-win32::git+https://github.com/dlfcn-win32/dlfcn-win32.git#tag=v1.1.1'
	'ext_Java.Interop::git+https://github.com/xamarin/java.interop.git'
	'ext_libzip::git+https://github.com/nih-at/libzip.git#tag=rel-1-5-1'
	'ext_LibZipSharp::git+https://github.com/grendello/LibZipSharp.git'
	'ext_llvm::git+https://github.com/mono/llvm.git#branch=release_60'
	'ext_mman-win32::git+https://github.com/witwall/mman-win32.git'
	'ext_mono::git+https://github.com/mono/mono.git#branch=2018-10'
	'ext_mxe::git+https://github.com/xamarin/mxe.git#branch=xamarin'
	'ext_nrefactory::git+git://github.com/icsharpcode/NRefactory.git'
	'ext_opentk::git+https://github.com/mono/opentk.git'
	'ext_proguard::git+https://github.com/xamarin/proguard.git'
	'ext_sqlite::git+https://github.com/xamarin/sqlite.git#branch=3.27.1'
	'ext_xamarin-android-api-compatibility::git+https://github.com/xamarin/xamarin-android-api-compatibility.git'
	'ext_xamarin-android-tools::git+https://github.com/xamarin/xamarin-android-tools'
	
	"${_android_repo}/build-tools_r${_build_ver}-linux.zip"
	"${_android_repo}/platform-tools_r${_plat_ver}-linux.zip"
	"${_android_repo}/sdk-tools-linux-4333796.zip"
	"${_android_repo}/emulator-linux-${_emu_ver}.zip"
	"${_android_repo}/cmake-${_cmake_ver}-linux-x86_64.zip"
	"${_android_repo}/android-2.3.3_r02-linux.zip"
	"${_android_repo}/android-15_r03.zip"
	"${_android_repo}/android-16_r04.zip"
	"${_android_repo}/android-17_r02.zip"
	"${_android_repo}/android-18_r02.zip"
	"${_android_repo}/android-19_r03.zip"
	"${_android_repo}/android-20_r02.zip"
	"${_android_repo}/android-21_r02.zip"
	"${_android_repo}/android-22_r02.zip"
	"${_android_repo}/platform-23_r03.zip"
	"${_android_repo}/platform-24_r02.zip"
	"${_android_repo}/platform-25_r03.zip"
	"${_android_repo}/platform-26_r02.zip"
	"${_android_repo}/platform-27_r03.zip"
	"${_android_repo}/platform-28_r04.zip"
	"${_android_repo}/platform-Q_r02.zip"
	"${_android_repo}/docs-24_r01.zip"
	"${_android_repo}/android_m2repository_r16.zip"
	"${_android_repo}/x86-28_r04.zip"
	"${_apache_repo}/apache-ant-1.9.9-bin.zip"
	)
sha256sums=(
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'

	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP'
	)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# Submodules are hell
	git submodule init
	git config submodule.external/debugger-libs.url "$srcdir/ext_debugger-libs"
	git config submodule.external/dlfcn-win32.url "$srcdir/ext_dlfcn-win32"
	git config submodule.external/Java.Interop.url "$srcdir/ext_Java.Interop"
	git config submodule.external/libzip.url "$srcdir/ext_libzip"
	git config submodule.external/LibZipSharp.url "$srcdir/ext_LibZipSharp"
	git config submodule.external/llvm.url "$srcdir/ext_llvm"
	git config submodule.external/mman-win32.url "$srcdir/ext_mman-win32"
	git config submodule.external/mono.url "$srcdir/ext_mono"
	git config submodule.external/mxe.url "$srcdir/ext_mxe"
	git config submodule.external/nrefactory.url "$srcdir/ext_nrefactory"
	git config submodule.external/opentk.url "$srcdir/ext_opentk"
	git config submodule.external/proguard.url "$srcdir/ext_proguard"
	git config submodule.external/sqlite.url "$srcdir/ext_sqlite"
	git config submodule.external/xamarin-android-api-compatibility.url "$srcdir/ext_xamarin-android-api-compatibility"
	git config submodule.external/xamarin-android-tools.url "$srcdir/ext_xamarin-android-tools"
	git submodule update

cat <<EOF > Configuration.Override.props
<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" ToolsVersion="4.0" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <AndroidToolchainCacheDirectory>${srcdir}</AndroidToolchainCacheDirectory>
    <AndroidToolchainDirectory>${srcdir}\android-toolchain</AndroidToolchainDirectory>
    <AndroidMxeInstallPrefix>\$(AndroidToolchainDirectory)\mxe</AndroidMxeInstallPrefix>
  </PropertyGroup>
</Project>
EOF

	NO_SUDO=true make prepare MSBUILD=msbuild
}

build() {
	cd "${srcdir}/${_pkgname}"
	NO_SUDO=true make MSBUILD=msbuild all
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix="${pkgdir}/opt/xamarin-android" install
}

