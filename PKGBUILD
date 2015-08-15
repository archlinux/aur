#Maintainer: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname=unixbench
pkgver=5.1.3
pkgrel=3
pkgdesc="UnixBench is a simple benchmark whose purpose is to provide a  basic indicator of the performance of a Unix-like 
system."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
license=('GPL')
url="https://github.com/kdlucas/byte-unixbench"
depends=('perl')
source=("https://github.com/kdlucas/byte-unixbench/archive/v${pkgver}.tar.gz"
	'no-make.patch'
	'use_volatile.patch'
        'make_maxcopies_unbound_for_misc_and_system_suites.patch'
        'unreasonable_multicore-whetstone_results_fix.patch'
        'modern_compiler_optimizations.patch'
	'ubench')

md5sums=('bf94e09faa4f620bf3bc49e70dd9851c'
         'f3e196a745ec70bc80e552867394a3e5'
         '62fb020a60ac5b8059bf670517f460ca'
         '6dfea87ef70147d6961160529a5a4d00'
         '5de4883d86ab9e77120773790aea7ddf'
         '794cb884d98479d7d270d58bdea0def3'
         'd0a6a418559410ca65206ec3165b8e23')

prepare() {
   cd ${srcdir}/byte-unixbench-${pkgver}/UnixBench
   patch -Np1 -i ${srcdir}/no-make.patch
   patch -Np1 -i ${srcdir}/use_volatile.patch
   patch -Np2 -i ${srcdir}/make_maxcopies_unbound_for_misc_and_system_suites.patch
   patch -Np1 -i ${srcdir}/unreasonable_multicore-whetstone_results_fix.patch
   patch -Np1 -i ${srcdir}/modern_compiler_optimizations.patch
 
  }

build() {
   cd ${srcdir}/byte-unixbench-${pkgver}/UnixBench
   make
   }

package() {
   cd ${srcdir}/byte-unixbench-${pkgver}/UnixBench

   install -dm775 ${pkgdir}/usr/bin/unixbench
   cp -a {pgms,results,testdir,tmp,Run} ${pkgdir}/usr/bin/unixbench
   cp ${srcdir}/ubench ${pkgdir}/usr/bin/
   
   chmod 775 ${pkgdir}/usr/bin/ubench
   chmod 775 ${pkgdir}/usr/bin/unixbench/Run
   chmod ugoa+w ${pkgdir}/usr/bin/unixbench/{results,testdir,tmp}
   }


