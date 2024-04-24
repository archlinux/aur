# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Pascal Ernster <archlinux@hardfalcon.net>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://github.com/stha09/chromium-patches/releases

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=24.8.8
#_gcc_patches=112-patchset-1
pkgrel=4

_major_ver=${pkgver%%.*}
pkgname="electron${_major_ver}"
pkgdesc='Build cross platform desktop apps with web technologies'
arch=(x86_64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         nss # libnss3.so
         zlib libz.so)
makedepends=(clang
             git
             gn
             gperf
             harfbuzz-icu
             http-parser
             java-runtime-headless
             libnotify
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs whith is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-hydrogen
             npm
             patchutils
             pciutils
             pipewire
             python
             python-httplib2
             python-pyparsing
             python-requests
             python-six
             qt5-base
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        add-missing-includes-causing-build-errors.patch
        dawn-iwyu-add-cstdint-for-uint8_t.patch
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        icu-74.patch
        iwyu-add-cstdint-for-int-types-in-s2cellid.patch
        iwyu-add-cstdint-for-uintptr_t-in-device.patch
        iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch
        iwyu-add-stdint.h-for-integer-types-in-ui.patch
        iwyu-add-stdint.h-for-uint32_t-in-cc.patch
        iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch
        iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch
        iwyu-add-stdint.h-for-various-int-types-in-base.patch
        iwyu-add-stdint.h-for-various-int-types-in-comp.patch
        iwyu-add-stdint.h-for-various-integer-types-in-net.patch
        jinja-python-3.10.patch
        libxml2-2.12.patch
        more-fixes-for-gcc13.patch
        openscreen-iwyu-add-stdint.h.patch
        pdfium-iwyu-add-stdint.h-for-uint32_t.patch
        random-fixes-for-gcc13.patch
        sql-relax-constraints-on-VirtualCursor-layout.patch
        std-vector-non-const.patch
        swiftshader-add-cstdint-for-uint64_t.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=112.0.5615.204
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=16fa32231e2ccd89d2804b3f765319128b20c4ac
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v18.14.0
        chromium-mirror_buildtools_clang_format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=f97059df7f8b205064625cdb5f97b56668a125ef
        chromium-mirror_buildtools_third_party_libc++_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=e136ec5032a5e5d97e988ce66e8c269a80ff54c4
        chromium-mirror_buildtools_third_party_libc++abi_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=87d8fe050bedb143f232b9ff99a0a46897640e5d
        chromium-mirror_buildtools_third_party_libunwind_trunk::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=c5e861c7b48ee121d3719b7b5c14175c47ec5cc9
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=fef0b5aa1bd31efb88dfab804bdbe614f3d54f28
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=417b413dbe94a861ee050d42daf945cca02dba11
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=40c87d454d762f3daaeca334cd2dc962f0476b13
        chromium-mirror_third_party_android_ndk::git+https://chromium.googlesource.com/android_ndk.git#commit=8388a2be5421311dc75c5f937aae13d821a27f3d
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=a1abaf29e18910ca70547165018f8a1b9bf49a7d
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=3d3f3d6f27288d7b0628ae5259238162c5e5ae76
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=ed63a7459376a21e88b871006574dc2055a2ea35
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=bae60787d3e95ea25e5b3d2b98f896dab1d30932
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=58746ca5b9f9444a2a3549704602ecc6239f8f41
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=ca1690e221677cea3fb946f324eb89d846ec53f2
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=abb105db21e962eda5b7d9b7a0ac8dd701e0b987
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=e42ef68aa05ac0c163805f60b9b19284f3c2dee3
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=4274fe29dac91b7713244daebb6f1d2364d97193
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=799604a1041e9b3bc5d2789ecbd7e8db2e18e6b8
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=beb46ca0319882f262e682dd596880c92830687f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=fa5ade41ee480003d9c5af6f43567ba22e4e17e6
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=ffb88930c81ef7f7026a2433c424d8b3658580d4
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=27639d495e1cec411073bc82ba1fe368ce0ca89a
        chromium-mirror_third_party_crubit_src::git+https://chromium.googlesource.com/external/github.com/google/crubit.git#commit=f5cbdf4b54b0e6b9f63a4464a2c901c82e0f0209
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=a6898e71abf374d699ebaa121312e89bad8f100a
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=2436ae2c5444ba8008a9f092301209a87aef0483
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=3460f3558e7b469efb8a225894e21929c8c77629
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=ee0c52d52036ecadfd38affec86c04937480bedb
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=a56f9ec50e908362e20254fcef28e62a2f148d91
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=06929a556fdc39c8fe12965b69070c8df520a33e
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=a017e9b7f20743c69627b94d7d101e4e6baadb44
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=3f01161ff22c84c371b6dc3b5e0351e0d6e8e771
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=2822b589bc837fae6f66233e2cf2eef0f6ce8470
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=9ba6d25d0d9313569665d4a9d2b34f0f39f9a50e
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=cd53f7c0d6a1c005e38874d143c8876d375bae70
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=af29db7ec28d6df1c7f0f745186884091e602e07
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=d6e11ba68be0fd871fcae6356adf698203ca6f37
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=d019e3605f222ebc5a3a2484a2cb29db537551dd
        chromium-mirror_third_party_libFuzzer_src_electron24::git+https://chromium.googlesource.com/chromium/llvm-project/compiler-rt/lib/fuzzer.git#commit=debe7d2d1982e540fbd6bd78604bf001753f9e74
        chromium-mirror_third_party_centipede_src::git+https://chromium.googlesource.com/external/github.com/google/centipede.git#commit=63ed43d2bfa2c04e291e81d643a5581c9be90c53
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=70b12695e1967d9589dd15b345a039e575e8f429
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=5d16f1f430c7053f9ea75ea33897df0dc2d2c847
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=d260feced56cfdea53f941883c250d635ed6064d
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros_components::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=fb2448fc618b4e3634c8c4097b4a84fcfa34c540
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=b9ca37b3134861048986b75896c0915cbf2e97f9
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=441f98d02deafd9b090aea568282b28f66a50e36
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=6c45a4f3a05cb5dd700414fe4d94cf685159d3ce
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=0b6e6a152242c2fa30ffb29633d1b7d7b229b46b
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=5b7c744eb8310250ccc534f3f86a2015b3887a0a
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=db69ce6aea278bee88668fd9cc2af2e544516fdb
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=e4fbea0c9751ae8aa86629b197a28d8276a2b0da
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=fd7b5d48464475408d32d2611bdb6947d4246b97
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=2bdc210be9eb11ded16bf3ef1f6cadb0d4dcb0c2
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=bd6537fb1c4aa2164d97f96e78a9c826e360a0ed
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_minizip_src::git+https://chromium.googlesource.com/external/github.com/nmoinvaz/minizip.git#commit=1ff40343b55e738d941abb51c70eddb803db16e2
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=7fc833e889d1afda72c06220e5bed8fb43b2e5ce
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=db956674bbdfbaab5acdd3fdb4117c2fef5527e9
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=5d694418bc76f66463f06ce141c375062b0ba3b0
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=bf21ccb1007bb531b45d9978919a56ea5059c245
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=4090d4c0f9873f5f50b630c26c2439b5297a6e49
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=4bda78645d1d23a98473b793bc532a3ebff6c7f9
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=1787867f6183f056420e532eec640cba25efafea
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=3a8436ac436124a57a4e22d5c8713a2d42b381d7
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=21a85fef159f9942f636a43b14c64b481c2a05b2
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=4dc670a8c5575180caa3d4d03f1e05da0177240d
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=65dc7b383985eb4f63cd3e752136db8d9b4be8c0
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=f6752b7ed1fe3cc1491c0c47ec5804ee2bd0e59b
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=3575b5479af54e471ea6750a8585e2c9bc87801c
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=60ec371de65a63d588bcfce7a99482847ad1312e
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=3c1556cc73226c2895c1de9a925dc5fe623c8752
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=ebe84bec02c041d28f902da0214bf442743fc907
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=c7473676b8abc682e820546287044cee3bca9147
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=83866f19d3d61b28e94d71781646466b3a6623d8
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=d1b65aa5a88f6efd900604dfcda840154e9f16e2
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=6c8361e98f1daba65902f5e2fc1297893ac14b67
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=d75b9e9ff07ee42841b4e416629c9fbd4b058905
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=fe9d08f2b6e80af691bfb1a718e144c49a1b9eba
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=420cfd00f2de91de74bd9d4d8348e43c582d29f0
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=d80274d5869b17b8c9067a1022e4416ee7ed5e0d
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=659147817805d17c7be2d60bd7bbca7e780f9c82
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=6be0a66a1ebd7ebc5abc1b2f405a945f6d871521
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=c5ce393a9aa4ef905916bf5adb38ea7f61751370
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=a13cbc8559935c85201c975cbc2587e7dd5ea0f1
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=1103ef535ca1e100db5d4e59781a4e59369a9818
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=2ff42d2008f09f65de12e70c6ff0ad58ddb090ad
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=effd9257d456f2d42e9e22fa4f37a24d8cf0b5b5
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=166db27fd0d53afc0c716b1ae9c15725e380871f
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=ee69aa00ee8536f61db6a451f3858745cf587de6
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0944e71f4b2cb9a871bcbe353f95e889b64a611a
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=62e175ef9fae75335575964c845a302447c012c7
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=64bbf988543996eb8df9a86877b32917187eba8f
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=bc3ab29356a081d0b5dd4ac55e30f4b45d8794cc
        chromium-mirror_third_party_dawn_third_party_benchmark::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=e991355c02b93fe17713efe04cbc2e278e00fdbd
        chromium-mirror_third_party_dawn_third_party_protobuf_electron24::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf.git#commit=fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        chromium-mirror_third_party_vulkan-deps_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=6d41bb9c557c5a0eec61ffba1f775dc5f717a8f7
        chromium-mirror_third_party_vulkan-deps_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=4e2fdb25671c742a9fbe93a6034eb1542244c7e1
        chromium-mirror_third_party_vulkan-deps_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=aa331ab0ffcb3a67021caa1a0c1c9017712f2f31
        chromium-mirror_third_party_vulkan-deps_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=c9947cc8d5e421c876c39947f9a4f35a84cf5733
        chromium-mirror_third_party_vulkan-deps_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=e8b8e06d092ab406b097907ecaae1a8aae9c7d53
        chromium-mirror_third_party_vulkan-deps_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=20154742948a43657bbeea5d4946d6e0a6ea65cb
        chromium-mirror_third_party_vulkan-deps_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=27c28d4b4004f90f16b2d227e93a91481e0a229b
        chromium-mirror_third_party_vulkan-deps_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=5d2b7d957efd02582f94c44a1ea849ac4759a901
        # END managed sources
       )
sha256sums=('4cd0c6e0bf9b2799d5b07972dd0ffa080bff3b63a98ce4382ac179cda3b59759'
            '3255477d02d49ef86d47c727b9369f46dc787319bb648bf267a68f37e2041e50'
            '94baaaa6fbec0af6ec2e967f0b7440b4261a927e853e212d84f0aeaf56ae53f0'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            'b406bc9adb7fadcfbd26f204f3e0ef8c31a41fa09181edb28626167ac58fe038'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '547e092f6a20ebd15e486b31111145bc94b8709ec230da89c591963001378845'
            'd97dc00f66fa5868584e4b6d5ef817911eab2dc8022a37c75a00d063f4dac483'
            'ffe499d63c9c1074cbc3995c188c89b748388dbb9dccf975ce28a434c723acf7'
            '94995b4e37671dcd27968bd5a2ebcf50e67bd22659a4bb4a5d0a4f81ff54f471'
            '0914be53b2205b34e4da96f5a94505ac2a01e3639ff433535a23be2d0d581fa7'
            'f6a0e149ef5195883c56a875ae366ed92d9960652f2657bfb65b5408badafc65'
            '7af466e4b5985cc9f0b33df2f3cd2e458c7cbfd7190505d105aad4401c9d072b'
            '727588a1b42f6cfe54acf4759a0c3ad3778590d5a5cefcdcb54b579ba16b09c8'
            '0003e737072f4f1b22ff932221595e85dd9bf65720ccac36f840cccb8000e3e1'
            '6b3c296de83c333678bc3d7cac939f33bbadae94c96299566ff2e31121c46256'
            '5dfbfd073f78c887bbffca2b644116571cc9b1196867e44e8fc0cbb40afcf1bc'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'bfae9e773edfd0ddbc617777fdd4c0609cba2b048be7afe40f97768e4eb6117e'
            '9d1f69f668e12fc14b4ccbcf88cb5a3acf666df06dafa8834f037bd8110ca17f'
            '8c9662bed23bfd66ae76d044541f316624386ca4b3baef57a47289feb3db58a9'
            '890b6836cea4c31513166db720b210da20d20bcd97a713545268cceffd707af5'
            '3fb0636e9560760d99e7c9606b1c9b59eef9d91ed3419cc95b43302759f249be'
            'e66be069d932fe18811e789c57b96249b7250257ff91a3d82d15e2a7283891b7'
            '893bc04c7fceba2f0a7195ed48551d55f066bbc530ec934c89c55768e6f3949c'
            '208f2ebcef5c690207e6e798ffbf9e92214e9d35f415c2f6b93efebad831b7e2'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '3ae82375ba212c31fd4ba6f1fa4e2445eeca8eb8c952176131ad57c0258db224'
            'ec3e180505b9e3d05306194180d927f76ebf156967d67af7f629716ffb4b747b'
            '3d5af1414e90349a6f412d8264c9b613346a38adecf226447d1d0d511f9410d3'
            'ef9579f9003a6e2a5d7fe22323e7785e0e58d19f8f4e61e8260c13ca8b24469c'
            '3ff2f108019f2639c665a0f15d45b40c900683e1fd5643f7c4ca589c1e87d9e0'
            'df9143c5b5e8f9b3251dea437e3f2dc78eb0356af71fb293f6fff2e3d5c8e876'
            '9cbe49d0e2e0e3c000c2d67baf431cb356f9e1ca572c21a26a318ea160d3ad74'
            '2dc99a832908e5f3d6bf31128ee603c440d81a1e974d26795935e3c690ebdc8f'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            'a62dd76d5ebcae2e2302509f057d21c35ffd69549ee7cdac47b2a85616dcc9be'
            '36e9dbe8ac6705629e99f598c3e110cf838cea00d55d3c05749a59f69d7cfd92'
            '73ff90599c343c49a6eef79bf0e5792f5b9f42548016d14fd08f56a6bf2c9236'
            'ae9228e3e775fcdb1e5d18128d7ba5bfff838365734806159a66e82d6dab3288'
            '3f24737b2584913d3dde86002346147177477c3d871c5ae3eb25211af1509e95'
            'c9b25d8692fd7ce5425b5630058b5c4c0044827376e0a40b99a196f3fda87339'
            '0863ff9069e4fd20ccc18b5ce73159da0d194de2145cd12487572867ee3b0c47'
            '9751d80c46e8125978a986f02f2fa4a55d0472ddd6452d2e601001552af803d6'
            'ec2bec310ae9352c54bcafbc5bab33f7fe6dd4a1419d5eb532e8ec863f181ee3'
            'c01be0de69ce0017bd3036a60c73344adca2538b846a20ef050352a82ad99876'
            '239fa6c58415cbd4549eb4f4bff47b2d04bcc1e97a8d26bc61304da9be519dd8'
            '20e7783deb29e24aa46bdee407fcb083c3e7a682ee51f3b51af12e288dfab800'
            'f5975cf7a2ef7e7a31be419580b3a8ac3db7435445f2933f11b569d2888be879'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '197fffc4315ef9388699de6777ef0afad76fd2ade512b9b1386911ad8253c071'
            'f5a4b337697d317878370cb0f7acecc74c076ce0d093a426a746323eb1ee3d7d'
            '4f5fd6719234fbc67c517e20e2170db66d37455d69bec880624a0a0304a0e91c'
            '01ceed39b6eed97370fcedef2b332235bce70970b19ca784405b461a6e2e6d4b'
            '8f2a08b3d5786c98eba9177f5648b9b708bad477fa1b53848980bf91abc3d657'
            'fd0b02f624e3c2c539bfb584b2f9ea8998d73bc9e79ba232a9989e9771671a43'
            'd615098d93b92730428ad13f4bf5859742e8ea180c5586d1711c583b8839cd23'
            '9d5aa6a466afce59d143f5c4f883909d90fc990b406114eb55d766aa53e7871d'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '88906eca64d63d14d2e275a599849b4fbab12b438a8a1b6f1d788f28d4aa0f4b'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '43d5d18c4c02f8900c7eb2240cb5781d517839e5141f37107709c3932e1866c7'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            'b0731644c68b45df8364a1f164851c8cf97d2f23f6fb7e1f26386d13c3ce609d'
            '590333d14900d5117d082a5f31907d09552612f7b864c3ddc4dc0b00012e36c9'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            'c9ca3642870f0a017d3ec4e2c2d769b86bac0d09596a4d85c68e14bd952136e8'
            'f24d0f2e410f7b356a377d09ae0fc6e62fb2b23c8317e06f7fa5bf2461b49bda'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'd59a4abc4b367f4869a9a632657ebb5ca4ab805ccc3bc57466b96e611be0a3e9'
            '88cdf771889253831a8873b3234e80cd0b6604bd1fc31a93cff36fa9c2281159'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '5a720c28ef8557e80c4b660b2000529c0de428a05b34d0ced5bc56b1097a69ec'
            '409ee4de1d8d203c839118b398d508788cdd270ec9295b3c5375ac33f39c12af'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '465d2120d104a5ed94995b6c0f45f00a31339535847f8aa5466a8f337225a700'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '41d2cb4288578890154d831b3ffd8f53d24aa20810a9b5708666b75265a34865'
            '4fcb8ebca4a72800397c5e08d1c5eae878767f5df960b0e4214d0de775fe160c'
            '8cb9e24c2f209d859c11451d618c27b306c454a45cb84afc39e16b1b8214a529'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            '9445dd455359f74d4e036501dada11c79d5961cde8f8f54def6269afddcca2a6'
            '475844c5df843a40b14bd13d826b86b6550ad1de271312d0a893d40edba3fd01'
            '2fd0d09ac3393e18b239de977257127dd050f6cf48b190656a776874f3ea6b13'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            '94ad151b2b4aebd56854c95079e2efa391a028c9e4b81bb440c5b31bf78a7738'
            '1a273225e8f25d924bea44c42d652306ff721f35b2b57e1b8029dc3396a482b3'
            'cc74c39e0133905a1f4f264590b44282df4231b73972e7a9708b311e46e00f88'
            'e854e84d1456ce5aacd1618ebef6a757786d5356ae9b7853b7773ce74b2301e2'
            '04e254781b49a98a7c9ffb30dd831ff1bb8d07714f85b226adfb2402b6e155e5'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '698e598c6f94a46eb9a26020a74d8904def28553157712af8afc3e809771ff25'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '18c1378aeee0080ca2f575ff0ef25f0d3c731c997106c5d6bf638fa73f776c3f'
            '7b32c27a5513c451032132fe5dc724de23d3b0738a0609a96bd44deee1d46681'
            '5b213f27fae856eb2abffa5ec1c7d087c51701bdfc63cecf73c4d0e8f017e49d'
            '169037ec350ee405e0412aadb233d4bf346e8eb268f0b061672e5731a24ce71c'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'c7ef8205f3c0455cca339e50014c2e07a41e41cce0e872f1c1a788532516a89b'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '1617fad681c1f653a12c4efd68646255f1530c572a79530205f23fb222eac876'
            'd49593e7559dfd1c0e3d7200b26241fd3116ab487bbd09d2dea30c2478ab77bd'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            'c2389ead088f21c5729b58f5930ad97cd4c83878c03e30586de25a9cf128573e'
            '203282ecd2d7c20456cb2612c0db7306ea0d75f2b7a1df0673647f18aff2d218'
            'b8680bd4b53632b4e7ad590b02214fbd73b4cc73a9fa8cf4e0e3069596c675cd'
            'e2071c48fd06f08a5af342763284fe600fed82cd440869db739a555aa1b052c9'
            '761b55ae691718c4434ce69bee102bbdd9e32d262822c0c3f0afe1d7270aae15'
            '3047e861dc6768a97bb19ab35db13dacf49670a4f5749d0c31a74dda7ae9975e'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'd38883e29d16a1e7f94c5d19111f83e63f5dbb438e5dcc34c0d658b9bb163f02'
            '02d2c8033992b0e32ef65959b5b53593ec01915952a73d74265e1a97650bdc51'
            'dd68c4ce28de07a8c86d6a613089a37a87f3bd1c9958c0aef62f391c0aa78eeb'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'c2e942b6bdbaab284856a53d3f04979ab15043843004340b8277d364a37099eb'
            'e1c4d77121d49620986bf34b176258f2c97d2a477a9a3bce8fc702e2502d2c14'
            'cdbb469196266a117b7a6bade15ee4092bc113a4a52bca3fc86b06d47032fafa'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            '7e6162d4a4dc93eb389bc535dd5f6a370834cdddbbdfa5c174cb1830685ecb4f'
            '7fb6217589210546f5a851d2b71b61fbf025224fb6be07030a380ee648ba0475'
            '965802bae3a0b3809747f4ad117a1d7da3d756a22d0f2bc56f5e4460dce16709'
            '51bc3369ec18057a024c24e079cc0e15afdfb196021e4bdbde800d6ed294632d'
            '9b1942dbc8a2c8d3ba0532b33e64aa0361f4d9cab19644a833682d3b85471d81'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            'b5f1b797e59e54882fbfb9088f79037d050359a00b053f5209a7b1b52aacc541'
            '24bc584a34bb17c74a207c9c8c67491803539fbae0f22b41baff11b40f74b895'
            '76cba4f141d65ad3d1ce73bef70c2b08766892c11e2d6968475823ba8408fcd0'
            '6a7be311617446dd1534863e8f3e02159caaa9c4efbc7d2564c83c1a4faaa31b'
            '2d2b64a30b8fdab74ec93f2d4b0eb65a05a4fba5840cad7f89a7e68fdb49c329'
            '8fa4f52720fb5fce6a0cefcdf119f57f3b419078dc543ba9567b77eb7fba8604'
            '982cee49603466fba4c1dc4f4b3b44f1e24b18eb88bd898eaa8e32cc0d7b62f9'
            '71191c953111a08a0e0df6a724bd331a9efb1994b872d2c081f3214324097720'
            'fed577b332bdd38780320b3187da789043c16899d9dfaa3d3f546b05b39047a3'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            'b6e035921cf89b91b1eab776b892d1961e9c2bc0792351545f194ee7ef0a863b'
            '1b705b1c27472ee5a10c531ab043fd5ebc0229acd3353b040246f1920bfa0737'
            '670d707f588762f5a2bf7f9794f79cbb2f0cf49c798971f673220157bdd5378f'
            'b0214aeba69453365d24e9a717aa1f5fd8d2a95a8858a233496dddaf6200309f'
            '757b656ae79d5434222143221700a193593a5f07ca6b1ce0104fb167c0ef6590'
            'af7fcf80a4d5f12c29eb1c442194de7635947657ed51cccc0c4e3d14dee3add6'
            '355d9ea34b8773a8f0705c07fb76c266ba6bb26ab3b877c22a712f20b51b2da6'
            '785f769c6c0d465f79038ec4f4c210025043285c345041667b122296c6b961e1'
            'c07cb7d7fe3b65ffe869aea3e236cb4e68b36f997df39508da6ab051ad1b330f'
            '0434674e57fc3c000ca5b0a496d51bb8f8b6422e24547c8698450fba0e459bcd'
            'fc7fcecb1f97995e17bd743274c8e49bb5969ef27783dced4cd6e2ee4a971a75'
            '75b897d38208c985cbe08443ad9253db04a716066fd92b0d05f2fd2fee32b4ff'
            '7d89448b9cccc0e2309ce34fef37ed85fd08fd2b030422e456fc531ebb1e8f80'
            'f17902d2a4ceeb55828422d00b75ee7b760d50cfb09b3cf51be7778058535dd0'
            'a3bdc184f8379ccbaa062e1b7b0815d630136257d28b71818b54f715a49e147e'
            '50041d039e123b1bc6388ae7667cd1576a8f75c18d86074fe9dffa87e9ee1a38'
            '45781a8043f4f46f9b9093cac1dc8249de7ddbdd2cb6cd18ffd9a4816254821c'
            'f0a849263ec3221006aca6e57dcfe50614dc452c5c40eaa117f1ec303a766d78'
            'a719818d8969f4b20ea6bcc3793851567e0e12b2b610823ca8a1d9a82b98777d'
            '9accaf183684a7a78df2dfe0f9a44e4b2e29cf62c18b4fa9c63dc5416a257c3b'
            'ae74e24739e7d2bd4ec85379ddece7b866540b437711200579937232fc9c46c0')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]="dav1d libdav1d.so"
  [ffmpeg]=ffmpeg
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs https://github.com/AOMediaCodec/libavif/commit/5410b23f76
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg libjpeg.so"
  [libpng]="libpng libpng16.so"
  #[libvpx]=libvpx
  [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so"
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  [snappy]=snappy # libsnappy.so # needs libstdc++
  [woff2]="woff2 libwoff2dec.so" # needs libstdc++
  [zlib]=minizip # libminizip.so
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

_update_sources() {
  python makepkg-source-roller.py update "v$pkgver" "$pkgname"
  updpkgsums
}

prepare() {
  sed -i "s|@ELECTRON@|${pkgname}|" electron-launcher.sh
  sed -i "s|@ELECTRON@|${pkgname}|" electron.desktop
  sed -i "s|@ELECTRON_NAME@|Electron ${_major_ver}|" electron.desktop

  cp -r chromium-mirror_third_party_depot_tools depot_tools
  export PATH+=":$PWD/depot_tools" DEPOT_TOOLS_UPDATE=0
  export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  rbash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

  pushd src/electron
  patch -Np1 -i ../../std-vector-non-const.patch
  popd

  echo "Running hooks..."
  # depot_tools/gclient.py runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py \
    -s src/third_party/dawn --revision src/gpu/webgpu/DAWN_VERSION
  src/tools/update_pgo_profiles.py --target=linux update \
    --gs-url-base=chromium-optimization-profiles/pgo_profiles
  depot_tools/download_from_google_storage.py --no_resume --extract --no_auth \
    --bucket chromium-nodejs -s src/third_party/node/node_modules.tar.gz.sha1
  # Create sysmlink to system clang-format
  ln -s /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  # Use system java
  mkdir -p src/third_party/jdk/current/bin
  ln -sfn /usr/bin/java src/third_party/jdk/current/bin/
  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  ## Upstream fixes

  patch -Np1 -i "${srcdir}/sql-relax-constraints-on-VirtualCursor-layout.patch"

  # GCC13 patches for chromium (https://github.com/archlinux/svntogit-packages/commit/470e5cbc7b58b4955664cdae386161d22c17d980)
  patch -Np1 -i "${srcdir}/swiftshader-add-cstdint-for-uint64_t.patch" -d "third_party/swiftshader"
  patch -Np1 -i "${srcdir}/dawn-iwyu-add-cstdint-for-uint8_t.patch" -d "third_party/dawn"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-base.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-uintptr_t-in-device.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-chrome_pdf.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint64_t-in-EncounteredSurface.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-integer-types-in-ui.patch"
  patch -Np1 -i "${srcdir}/openscreen-iwyu-add-stdint.h.patch" -d "third_party/openscreen/src"
  patch -Np1 -i "${srcdir}/pdfium-iwyu-add-stdint.h-for-uint32_t.patch" -d "third_party/pdfium"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-uint32_t-in-cc.patch"
  patch -Np1 -i "${srcdir}/add-missing-includes-causing-build-errors.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-int-types-in-gpu_feature_info.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-int-types-in-comp.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-stdint.h-for-various-integer-types-in-net.patch"
  patch -Np1 -i "${srcdir}/iwyu-add-cstdint-for-int-types-in-s2cellid.patch"
  patch -Np1 -i "${srcdir}/random-fixes-for-gcc13.patch"
  patch -Np1 -i "${srcdir}/more-fixes-for-gcc13.patch"

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Fix build with libxml2 2.12
  patch -Np1 -i ../libxml2-2.12.patch

  # Fix build with ICU 74
  patch -Np1 -i ../icu-74.patch

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    third_party_dir="third_party/$_lib"
    if [ ! -d "${third_party_dir}" ]; then
      third_party_dir="base/${third_party_dir}"
    fi
    find "${third_party_dir}" -type f \
        \! -path "${third_party_dir}/chromium/*" \
        \! -path "${third_party_dir}/google/*" \
        \! -path 'third_party/harfbuzz-ng/utils/hb_scoped.h' \
        \! -regex '.*\.\(gn\|gni\|isolate\)' \
        -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  cd src

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'is_component_ffmpeg=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}"
  ninja -C out/Release electron electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir:?}/usr/lib/${pkgname}"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/${pkgname}"

  chmod u+s "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/${pkgname}"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      "$(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" "${l}")" \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -Dm755 "${srcdir}/electron-launcher.sh" \
    "${pkgdir}/usr/bin/${pkgname}"

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 electron.desktop \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"  # hicolor has no 1024x1024
}
