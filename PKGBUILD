# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://gitlab.archlinux.org/archlinux/packaging/packages/tesseract-data/-/blob/main/PKGBUILD?ref_type=heads

#cd "piper-voices"
#mapfile -t _locales < <(find . -mindepth 2 -maxdepth 2 -type d -name "*_*" -printf '"%P"\n' | sort)
#for locale in "${_locales[@]}"; do locale="\"${locale/*\/}"; locale="${locale,,}"; locale="${locale/_/-}"; echo "$locale"; done


pkgname="piper-voices"
epoch=2
pkgver=1.0.0
pkgrel=2
pkgdesc="Voices for Piper text to speech system"
url="https://huggingface.co/rhasspy/piper-voices"
license=("MIT")
arch=("any")
groups=("piper-voices")
provides=("piper-voices")
depends=("piper-voices-common")
conflicts=("piper-voices-minimal")
makedepends=("git-lfs")
options=("!strip")

prepare(){
 # replace .onnx git lfs pointers (few bytes) with actual trained models (dozens of MB)
 # https://github.com/git-lfs/git-lfs/issues/1351#issuecomment-230495709
 # https://github.com/git-lfs/git-lfs/issues/3508#issuecomment-460492294
 # https://stackoverflow.com/a/58316954
 # https://stackoverflow.com/a/74931406
 # https://manpages.debian.org/testing/git-lfs/git-lfs-pull.1.en.html

 # needed to avoid smudge error
 rm -rf "piper-voices"
 
 # download the repo by keeping the lfs pointers
 GIT_LFS_SKIP_SMUDGE=1 git clone "https://huggingface.co/rhasspy/piper-voices"

 # uncomment to download all lfs objects (~6GB total, 107 models)
 #git lfs pull 
 
 #:
 
 # remove mp3 samples
 cd "piper-voices"
 find . -type d -name 'samples' -exec rm -rf {} +
}

package(){
    :
}
