# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: loqs <bugs-archlinux@entropy-collector.net>
# Contributor: kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/
# https://gitlab.com/Matt.Jolly/chromium-patches/-/tags

# Note: source array can be synced with an Electron release after updating $pkgver with:
# bash -c 'source PKGBUILD; _update_sources'

pkgver=33.3.1
_gcc_patches=130
pkgrel=1
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
         libpulse libpulse.so
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
             libva
             lld
             llvm
             ninja
             # Electron ships a vendored nodejs. Meanwhile the npm dependency pulls in nodejs which is Arch's freshest version.
             # Pinning the closest LTS here makes the build environment more consistent with the vendored copy.
             nodejs-lts-iron
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
             rsync
             rust
             rust-bindgen
             wget
             yarn)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
options=('!lto') # Electron adds its own flags for ThinLTO
source=("git+https://github.com/electron/electron.git#tag=v$pkgver"
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/$_gcc_patches/chromium-patches-$_gcc_patches.tar.bz2
        # Chromium
        compiler-rt-adjust-paths.patch
        blink-fix-missing-stdlib-include.patch
        # Electron
        default_app-icon.patch
        electron-launcher.sh
        electron.desktop
        jinja-python-3.10.patch
        use-system-libraries-in-node.patch
        makepkg-source-roller.py
        # BEGIN managed sources
        chromium-mirror::git+https://github.com/chromium/chromium.git#tag=130.0.6723.170
        chromium-mirror_third_party_nan::git+https://github.com/nodejs/nan.git#commit=e14bdcd1f72d62bca1d541b66da43130384ec213
        chromium-mirror_third_party_electron_node::git+https://github.com/nodejs/node.git#tag=v20.18.1
        chromium-mirror_third_party_engflow-reclient-configs::git+https://github.com/EngFlow/reclient-configs.git#commit=955335c30a752e9ef7bff375baab5e0819b6c00d
        chromium-mirror_third_party_clang-format_script::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/clang/tools/clang-format.git#commit=3c0acd2d4e73dd911309d9e970ba09d58bf23a62
        chromium-mirror_third_party_libc++_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git#commit=50ab693ecb611942ce4440d8c9ed707ee65ed5e8
        chromium-mirror_third_party_libc++abi_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git#commit=29b2e9a0f48688da116692cb04758393053d269c
        chromium-mirror_third_party_libunwind_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git#commit=dc70138c3e68e2f946585f134e20815851e26263
        chromium-mirror_chrome_test_data_perf_canvas_bench::git+https://chromium.googlesource.com/chromium/canvas_bench.git#commit=a7b40ea5ae0239517d78845a5fc9b12976bfc732
        chromium-mirror_chrome_test_data_perf_frame_rate_content::git+https://chromium.googlesource.com/chromium/frame_rate/content.git#commit=c10272c88463efeef6bb19c9ec07c42bc8fe22b9
        chromium-mirror_chrome_test_data_xr_webvr_info::git+https://chromium.googlesource.com/external/github.com/toji/webvr.info.git#commit=c58ae99b9ff9e2aa4c524633519570bf33536248
        chromium-mirror_media_cdm_api::git+https://chromium.googlesource.com/chromium/cdm.git#commit=eb21edc44e8e5a82095037be80c8b15c51624293
        chromium-mirror_native_client::git+https://chromium.googlesource.com/native_client/src/native_client.git#commit=6944e6b79dbd1b9776681c025bd4f4c281bb4791
        chromium-mirror_net_third_party_quiche_src::git+https://quiche.googlesource.com/quiche.git#commit=9808dac40e034f09d7af53d3d79589a02e39c211
        chromium-mirror_testing_libfuzzer_fuzzers_wasm_corpus::git+https://chromium.googlesource.com/v8/fuzzer_wasm_corpus.git#commit=f650ff816f2ef227f61ea2e9f222aa69708ab367
        chromium-mirror_third_party_accessibility_test_framework_src::git+https://chromium.googlesource.com/external/github.com/google/Accessibility-Test-Framework-for-Android.git#commit=4a764c690353ea136c82f1a696a70bf38d1ef5fe
        chromium-mirror_third_party_angle::git+https://chromium.googlesource.com/angle/angle.git#commit=fffbc739779a2df56a464fd6853bbfb24bebb5f6
        chromium-mirror_third_party_anonymous_tokens_src::git+https://chromium.googlesource.com/external/github.com/google/anonymous-tokens.git#commit=6ea6ec78f9e4998d0a7a5677b2aec08f0ac858f8
        chromium-mirror_third_party_content_analysis_sdk_src::git+https://chromium.googlesource.com/external/github.com/chromium/content_analysis_sdk.git#commit=9a408736204513e0e95dd2ab3c08de0d95963efc
        chromium-mirror_third_party_dav1d_libdav1d::git+https://chromium.googlesource.com/external/github.com/videolan/dav1d.git#commit=6b3c489a2ee2c030f351f21987c27611b4cbe725
        chromium-mirror_third_party_dawn::git+https://dawn.googlesource.com/dawn.git#commit=f1041a163d06fb86b082e29260ab53a4637b0e98
        chromium-mirror_third_party_highway_src::git+https://chromium.googlesource.com/external/github.com/google/highway.git#commit=8295336dd70f1201d42c22ab5b0861de38cf8fbf
        chromium-mirror_third_party_google_benchmark_src::git+https://chromium.googlesource.com/external/github.com/google/benchmark.git#commit=344117638c8ff7e239044fd0fa7085839fc03021
        chromium-mirror_third_party_boringssl_src::git+https://boringssl.googlesource.com/boringssl.git#commit=58f3bc83230d2958bb9710bc910972c4f5d382dc
        chromium-mirror_third_party_breakpad_breakpad::git+https://chromium.googlesource.com/breakpad/breakpad.git#commit=6b0c5b7ee1988a14a4af94564e8ae8bba8a94374
        chromium-mirror_third_party_cast_core_public_src::git+https://chromium.googlesource.com/cast_core/public.git#commit=71f51fd6fa45fac73848f65421081edd723297cd
        chromium-mirror_third_party_catapult::git+https://chromium.googlesource.com/catapult.git#commit=296226a4a0067c8cffeb8831fb87526a8035f3cc
        chromium-mirror_third_party_ced_src::git+https://chromium.googlesource.com/external/github.com/google/compact_enc_det.git#commit=ba412eaaacd3186085babcd901679a48863c7dd5
        chromium-mirror_third_party_chromium-variations::git+https://chromium.googlesource.com/chromium-variations.git#commit=6aa57f2c6b49402b55ec607c17bd7ee8946970b0
        chromium-mirror_third_party_cld_3_src::git+https://chromium.googlesource.com/external/github.com/google/cld_3.git#commit=b48dc46512566f5a2d41118c8c1116c4f96dc661
        chromium-mirror_third_party_colorama_src::git+https://chromium.googlesource.com/external/colorama.git#commit=3de9f013df4b470069d03d250224062e8cf15c49
        chromium-mirror_third_party_cpu_features_src::git+https://chromium.googlesource.com/external/github.com/google/cpu_features.git#commit=936b9ab5515dead115606559502e3864958f7f6e
        chromium-mirror_third_party_cpuinfo_src::git+https://chromium.googlesource.com/external/github.com/pytorch/cpuinfo.git#commit=ca678952a9a8eaa6de112d154e8e104b22f9ab3f
        chromium-mirror_third_party_crc32c_src::git+https://chromium.googlesource.com/external/github.com/google/crc32c.git#commit=d3d60ac6e0f16780bcfcc825385e1d338801a558
        chromium-mirror_third_party_cros_system_api::git+https://chromium.googlesource.com/chromiumos/platform2/system_api.git#commit=2f88f9c4581a9c854604fa23516de8c9c13b227b
        chromium-mirror_third_party_crossbench::git+https://chromium.googlesource.com/crossbench.git#commit=2b812597dd143dbdc560ff2f28d5f8d3adc700d4
        chromium-mirror_third_party_depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git#commit=22df6f8e622dc3e8df8dc8b5d3e3503b169af78e
        chromium-mirror_third_party_devtools-frontend_src::git+https://chromium.googlesource.com/devtools/devtools-frontend.git#commit=deee9c11c9f76ef595b7d0b52fcf677d25aac5f2
        chromium-mirror_third_party_dom_distiller_js_dist::git+https://chromium.googlesource.com/chromium/dom-distiller/dist.git#commit=199de96b345ada7c6e7e6ba3d2fa7a6911b8767d
        chromium-mirror_third_party_eigen3_src::git+https://chromium.googlesource.com/external/gitlab.com/libeigen/eigen.git#commit=134b526d6110061469168e7e0511822a8e30bcaf
        chromium-mirror_third_party_farmhash_src::git+https://chromium.googlesource.com/external/github.com/google/farmhash.git#commit=816a4ae622e964763ca0862d9dbd19324a1eaf45
        chromium-mirror_third_party_fast_float_src::git+https://chromium.googlesource.com/external/github.com/fastfloat/fast_float.git#commit=3e57d8dcfb0a04b5a8a26b486b54490a2e9b310f
        chromium-mirror_third_party_ffmpeg::git+https://chromium.googlesource.com/chromium/third_party/ffmpeg.git#commit=91903c28af60a732a051c343b496e1188eec9b05
        chromium-mirror_third_party_flac::git+https://chromium.googlesource.com/chromium/deps/flac.git#commit=689da3a7ed50af7448c3f1961d1791c7c1d9c85c
        chromium-mirror_third_party_flatbuffers_src::git+https://chromium.googlesource.com/external/github.com/google/flatbuffers.git#commit=8db59321d9f02cdffa30126654059c7d02f70c32
        chromium-mirror_third_party_fontconfig_src::git+https://chromium.googlesource.com/external/fontconfig.git#commit=14d466b30a8ab4a9d789977ed94f2c30e7209267
        chromium-mirror_third_party_fp16_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FP16.git#commit=0a92994d729ff76a58f692d3028ca1b64b145d91
        chromium-mirror_third_party_gemmlowp_src::git+https://chromium.googlesource.com/external/github.com/google/gemmlowp.git#commit=13d57703abca3005d97b19df1f2db731607a7dc2
        chromium-mirror_third_party_grpc_src::git+https://chromium.googlesource.com/external/github.com/grpc/grpc.git#commit=822dab21d9995c5cf942476b35ca12a1aa9d2737
        chromium-mirror_third_party_freetype_src::git+https://chromium.googlesource.com/chromium/src/third_party/freetype2.git#commit=83af801b552111e37d9466a887e1783a0fb5f196
        chromium-mirror_third_party_freetype-testing_src::git+https://chromium.googlesource.com/external/github.com/freetype/freetype2-testing.git#commit=7a69b1a2b028476f840ab7d4a2ffdfe4eb2c389f
        chromium-mirror_third_party_fxdiv_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/FXdiv.git#commit=63058eff77e11aa15bf531df5dd34395ec3017c8
        chromium-mirror_third_party_harfbuzz-ng_src::git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git#commit=1da053e87f0487382404656edca98b85fe51f2fd
        chromium-mirror_third_party_instrumented_libs::git+https://chromium.googlesource.com/chromium/third_party/instrumented_libraries.git#commit=bb6dbcf2df7a9beb34c3773ef4df161800e3aed9
        chromium-mirror_third_party_emoji-segmenter_src::git+https://chromium.googlesource.com/external/github.com/google/emoji-segmenter.git#commit=6b8f235b72deba7d6ef113631129b274c14941ef
        chromium-mirror_third_party_ots_src::git+https://chromium.googlesource.com/external/github.com/khaledhosny/ots.git#commit=46bea9879127d0ff1c6601b078e2ce98e83fcd33
        chromium-mirror_third_party_libgav1_src::git+https://chromium.googlesource.com/codecs/libgav1.git#commit=a2f139e9123bdb5edf7707ac6f1b73b3aa5038dd
        chromium-mirror_third_party_googletest_src::git+https://chromium.googlesource.com/external/github.com/google/googletest.git#commit=0953a17a4281fc26831da647ad3fcd5e21e6473b
        chromium-mirror_third_party_hunspell_dictionaries::git+https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries.git#commit=41cdffd71c9948f63c7ad36e1fb0ff519aa7a37e
        chromium-mirror_third_party_icu::git+https://chromium.googlesource.com/chromium/deps/icu.git#commit=9408c6fd4a39e6fef0e1c4077602e1c83b15f3fb
        chromium-mirror_third_party_jsoncpp_source::git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git#commit=42e892d96e47b1f6e29844cc705e148ec4856448
        chromium-mirror_third_party_leveldatabase_src::git+https://chromium.googlesource.com/external/leveldb.git#commit=23e35d792b9154f922b8b575b12596a4d8664c65
        chromium-mirror_third_party_libFuzzer_src::git+https://chromium.googlesource.com/external/github.com/llvm/llvm-project/compiler-rt/lib/fuzzer.git#commit=487e79376394754705984c5de7c4ce7f82f2bd7c
        chromium-mirror_third_party_fuzztest_src::git+https://chromium.googlesource.com/external/github.com/google/fuzztest.git#commit=a29e31cb00ec9b123dec5a0c6b8d4bc12c2480c8
        chromium-mirror_third_party_domato_src::git+https://chromium.googlesource.com/external/github.com/googleprojectzero/domato.git#commit=053714bccbda79cf76dac3fee48ab2b27f21925e
        chromium-mirror_third_party_libaddressinput_src::git+https://chromium.googlesource.com/external/libaddressinput.git#commit=e8712e415627f22d0b00ebee8db99547077f39bd
        chromium-mirror_third_party_libaom_source_libaom::git+https://aomedia.googlesource.com/aom.git#commit=d5265b173616ce62de231cd1b1eae853ad03641e
        chromium-mirror_third_party_libavif_src::git+https://chromium.googlesource.com/external/github.com/AOMediaCodec/libavif.git#commit=c2177c3316a49505dcd592ba21073f7abc25cd37
        chromium-mirror_third_party_crabbyavif_src::git+https://chromium.googlesource.com/external/github.com/webmproject/CrabbyAvif.git#commit=adfb834d76c6a064f28bb3a694689fc14a42425e
        chromium-mirror_third_party_libavifinfo_src::git+https://aomedia.googlesource.com/libavifinfo.git#commit=8d8b58a3f517ef8d1794baa28ca6ae7d19f65514
        chromium-mirror_third_party_nearby_src::git+https://chromium.googlesource.com/external/github.com/google/nearby-connections.git#commit=3c8737f92d765407e4ff6c87b8758ba99ede40ed
        chromium-mirror_third_party_beto-core_src::git+https://beto-core.googlesource.com/beto-core.git#commit=89563fec14c756482afa08b016eeba9087c8d1e3
        chromium-mirror_third_party_securemessage_src::git+https://chromium.googlesource.com/external/github.com/google/securemessage.git#commit=fa07beb12babc3b25e0c5b1f38c16aa8cb6b8f84
        chromium-mirror_third_party_speedometer_v3.0::git+https://chromium.googlesource.com/external/github.com/WebKit/Speedometer.git#commit=8d67f28d0281ac4330f283495b7f48286654ad7d
        chromium-mirror_third_party_ukey2_src::git+https://chromium.googlesource.com/external/github.com/google/ukey2.git#commit=0275885d8e6038c39b8a8ca55e75d1d4d1727f47
        chromium-mirror_third_party_cros-components_src::git+https://chromium.googlesource.com/external/google3/cros_components.git#commit=08a6ca6559c8d07c79fb5576a44e016e3126c221
        chromium-mirror_third_party_libdrm_src::git+https://chromium.googlesource.com/chromiumos/third_party/libdrm.git#commit=ad78bb591d02162d3b90890aa4d0a238b2a37cde
        chromium-mirror_third_party_expat_src::git+https://chromium.googlesource.com/external/github.com/libexpat/libexpat.git#commit=624da0f593bb8d7e146b9f42b06d8e6c80d032a3
        chromium-mirror_third_party_libipp_libipp::git+https://chromium.googlesource.com/chromiumos/platform2/libipp.git#commit=2209bb84a8e122dab7c02fe66cc61a7b42873d7f
        chromium-mirror_third_party_libjpeg_turbo::git+https://chromium.googlesource.com/chromium/deps/libjpeg_turbo.git#commit=927aabfcd26897abb9776ecf2a6c38ea5bb52ab6
        chromium-mirror_third_party_liblouis_src::git+https://chromium.googlesource.com/external/liblouis-github.git#commit=9700847afb92cb35969bdfcbbfbbb74b9c7b3376
        chromium-mirror_third_party_libphonenumber_dist::git+https://chromium.googlesource.com/external/libphonenumber.git#commit=140dfeb81b753388e8a672900fb7a971e9a0d362
        chromium-mirror_third_party_libprotobuf-mutator_src::git+https://chromium.googlesource.com/external/github.com/google/libprotobuf-mutator.git#commit=a304ec48dcf15d942607032151f7e9ee504b5dcf
        chromium-mirror_third_party_libsrtp::git+https://chromium.googlesource.com/chromium/deps/libsrtp.git#commit=000edd791434c8738455f10e0dd6b268a4852c0b
        chromium-mirror_third_party_libsync_src::git+https://chromium.googlesource.com/aosp/platform/system/core/libsync.git#commit=f4f4387b6bf2387efbcfd1453af4892e8982faf6
        chromium-mirror_third_party_libvpx_source_libvpx::git+https://chromium.googlesource.com/webm/libvpx.git#commit=fbf63dff1f528d44f24bd662abb89fd01a4a1c25
        chromium-mirror_third_party_libwebm_source::git+https://chromium.googlesource.com/webm/libwebm.git#commit=26d9f667170dc75e8d759a997bb61c64dec42dda
        chromium-mirror_third_party_libwebp_src::git+https://chromium.googlesource.com/webm/libwebp.git#commit=845d5476a866141ba35ac133f856fa62f0b7445f
        chromium-mirror_third_party_libyuv::git+https://chromium.googlesource.com/libyuv/libyuv.git#commit=4620f1705822fd6ab99939f43ce63099bd3d9ae0
        chromium-mirror_third_party_lss::git+https://chromium.googlesource.com/linux-syscall-support.git#commit=ce877209e11aa69dcfffbd53ef90ea1d07136521
        chromium-mirror_third_party_material_color_utilities_src::git+https://chromium.googlesource.com/external/github.com/material-foundation/material-color-utilities.git#commit=13434b50dcb64a482cc91191f8cf6151d90f5465
        chromium-mirror_third_party_minigbm_src::git+https://chromium.googlesource.com/chromiumos/platform/minigbm.git#commit=3018207f4d89395cc271278fb9a6558b660885f5
        chromium-mirror_third_party_nasm::git+https://chromium.googlesource.com/chromium/deps/nasm.git#commit=f477acb1049f5e043904b87b825c5915084a9a29
        chromium-mirror_third_party_neon_2_sse_src::git+https://chromium.googlesource.com/external/github.com/intel/ARM_NEON_2_x86_SSE.git#commit=a15b489e1222b2087007546b4912e21293ea86ff
        chromium-mirror_third_party_openh264_src::git+https://chromium.googlesource.com/external/github.com/cisco/openh264.git#commit=478e5ab3eca30e600006d5a0a08b176fd34d3bd1
        chromium-mirror_third_party_openscreen_src::git+https://chromium.googlesource.com/openscreen.git#commit=b720e33d337c68353e5d80a72491fb438f27d93a
        chromium-mirror_third_party_openxr_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenXR-SDK.git#commit=288d3a7ebc1ad959f62d51da75baa3d27438c499
        chromium-mirror_third_party_pdfium::git+https://pdfium.googlesource.com/pdfium.git#commit=2b675cf15ab4b68bf1ed4e0511ba2479e11f1605
        chromium-mirror_third_party_perfetto::git+https://android.googlesource.com/platform/external/perfetto.git#commit=9170899ab284db894f14439e561f02f83a04d88e
        chromium-mirror_third_party_protobuf-javascript_src::git+https://chromium.googlesource.com/external/github.com/protocolbuffers/protobuf-javascript.git#commit=e34549db516f8712f678fcd4bc411613b5cc5295
        chromium-mirror_third_party_pthreadpool_src::git+https://chromium.googlesource.com/external/github.com/Maratyszcza/pthreadpool.git#commit=560c60d342a76076f0557a3946924c6478470044
        chromium-mirror_third_party_pyelftools::git+https://chromium.googlesource.com/chromiumos/third_party/pyelftools.git#commit=19b3e610c86fcadb837d252c794cb5e8008826ae
        chromium-mirror_third_party_quic_trace_src::git+https://chromium.googlesource.com/external/github.com/google/quic-trace.git#commit=caa0a6eaba816ecb737f9a70782b7c80b8ac8dbc
        chromium-mirror_third_party_pywebsocket3_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/pywebsocket3.git#commit=50602a14f1b6da17e0b619833a13addc6ea78bc2
        chromium-mirror_third_party_re2_src::git+https://chromium.googlesource.com/external/github.com/google/re2.git#commit=6dcd83d60f7944926bfd308cc13979fc53dd69ca
        chromium-mirror_third_party_ruy_src::git+https://chromium.googlesource.com/external/github.com/google/ruy.git#commit=c08ec529fc91722bde519628d9449258082eb847
        chromium-mirror_third_party_skia::git+https://skia.googlesource.com/skia.git#commit=d41eba845cdb7ade07e68f20676675c25e2734fc
        chromium-mirror_third_party_smhasher_src::git+https://chromium.googlesource.com/external/smhasher.git#commit=e87738e57558e0ec472b2fc3a643b838e5b6e88f
        chromium-mirror_third_party_snappy_src::git+https://chromium.googlesource.com/external/github.com/google/snappy.git#commit=c9f9edf6d75bb065fa47468bf035e051a57bec7c
        chromium-mirror_third_party_sqlite_src::git+https://chromium.googlesource.com/chromium/deps/sqlite.git#commit=567495a62a62dc013888500526e82837d727fe01
        chromium-mirror_third_party_swiftshader::git+https://swiftshader.googlesource.com/SwiftShader.git#commit=2afc8c97882a5c66abf5f26670ae420d2e30adc3
        chromium-mirror_third_party_text-fragments-polyfill_src::git+https://chromium.googlesource.com/external/github.com/GoogleChromeLabs/text-fragments-polyfill.git#commit=c036420683f672d685e27415de0a5f5e85bdc23f
        chromium-mirror_third_party_tflite_src::git+https://chromium.googlesource.com/external/github.com/tensorflow/tensorflow.git#commit=d29299c16ec49623af1294900dba53fc8864f0bb
        chromium-mirror_third_party_vulkan-deps::git+https://chromium.googlesource.com/vulkan-deps.git#commit=c045c2192ab45a144b419033dffe6190be5d8c93
        chromium-mirror_third_party_glslang_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/glslang.git#commit=dc1012140e015d43711514d1294ac6f626890a40
        chromium-mirror_third_party_spirv-cross_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Cross.git#commit=b8fcf307f1f347089e3c46eb4451d27f32ebc8d3
        chromium-mirror_third_party_spirv-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Headers.git#commit=2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801
        chromium-mirror_third_party_spirv-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git#commit=37d2fcb485bf3fcadb18ef90aab6f283dcc4be72
        chromium-mirror_third_party_vulkan-headers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Headers.git#commit=c6391a7b8cd57e79ce6b6c832c8e3043c4d9967b
        chromium-mirror_third_party_vulkan-loader_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Loader.git#commit=1108bba6c97174d172d45470a7470a3d6a564647
        chromium-mirror_third_party_vulkan-tools_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Tools.git#commit=4c63e845962ff3b197855f3ae4907a47d0863f5a
        chromium-mirror_third_party_vulkan-utility-libraries_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-Utility-Libraries.git#commit=ea5774a13e3017b6d5d79af6fba9f0d72ca5c61a
        chromium-mirror_third_party_vulkan-validation-layers_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/Vulkan-ValidationLayers.git#commit=ef846ac0883cde5e69ced0e7d7af59fe92f34e25
        chromium-mirror_third_party_vulkan_memory_allocator::git+https://chromium.googlesource.com/external/github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git#commit=56300b29fbfcc693ee6609ddad3fdd5b7a449a21
        chromium-mirror_third_party_wayland_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland.git#commit=a156431ea66fe67d69c9fbba8a8ad34dabbab81c
        chromium-mirror_third_party_wayland-protocols_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/wayland-protocols.git#commit=7d5a3a8b494ae44cd9651f9505e88a250082765e
        chromium-mirror_third_party_wayland-protocols_kde::git+https://chromium.googlesource.com/external/github.com/KDE/plasma-wayland-protocols.git#commit=0b07950714b3a36c9b9f71fc025fc7783e82926e
        chromium-mirror_third_party_wayland-protocols_gtk::git+https://chromium.googlesource.com/external/github.com/GNOME/gtk.git#commit=40ebed3a03aef096addc0af09fec4ec529d882a0
        chromium-mirror_third_party_webdriver_pylib::git+https://chromium.googlesource.com/external/github.com/SeleniumHQ/selenium/py.git#commit=fc5e7e70c098bfb189a9a74746809ad3c5c34e04
        chromium-mirror_third_party_webgl_src::git+https://chromium.googlesource.com/external/khronosgroup/webgl.git#commit=1b6371436a0a60e6b9a4ae2a40a8eba198e3af02
        chromium-mirror_third_party_webgpu-cts_src::git+https://chromium.googlesource.com/external/github.com/gpuweb/cts.git#commit=2f55512456a725e77f3baac3d951de5c6c5e28a3
        chromium-mirror_third_party_webrtc::git+https://webrtc.googlesource.com/src.git#commit=28b793b4dd275bf2b901b87e01c0ee8d4f5732fc
        chromium-mirror_third_party_wuffs_src::git+https://skia.googlesource.com/external/github.com/google/wuffs-mirror-release-c.git#commit=e3f919ccfe3ef542cfc983a82146070258fb57f8
        chromium-mirror_third_party_weston_src::git+https://chromium.googlesource.com/external/anongit.freedesktop.org/git/wayland/weston.git#commit=ccf29cb237c3ed09c5f370f35239c93d07abfdd7
        chromium-mirror_third_party_xdg-utils::git+https://chromium.googlesource.com/chromium/deps/xdg-utils.git#commit=cb54d9db2e535ee4ef13cc91b65a1e2741a94a44
        chromium-mirror_third_party_xnnpack_src::git+https://chromium.googlesource.com/external/github.com/google/XNNPACK.git#commit=c4a28daf28c98300da9d9b5213c53f762908825e
        chromium-mirror_tools_page_cycler_acid3::git+https://chromium.googlesource.com/chromium/deps/acid3.git#commit=a926d0a32e02c4c03ae95bb798e6c780e0e184ba
        chromium-mirror_third_party_zstd_src::git+https://chromium.googlesource.com/external/github.com/facebook/zstd.git#commit=20707e3718ee14250fb8a44b3bf023ea36bd88df
        chromium-mirror_v8::git+https://chromium.googlesource.com/v8/v8.git#commit=932a8d7bb284242fd92234cf734921b8383ae4f6
        chromium-mirror_third_party_angle_third_party_glmark2_src::git+https://chromium.googlesource.com/external/github.com/glmark2/glmark2.git#commit=ca8de51fedb70bace5351c6b002eb952c747e889
        chromium-mirror_third_party_angle_third_party_rapidjson_src::git+https://chromium.googlesource.com/external/github.com/Tencent/rapidjson.git#commit=781a4e667d84aeedbeb8184b7b62425ea66ec59f
        chromium-mirror_third_party_angle_third_party_VK-GL-CTS_src::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/VK-GL-CTS.git#commit=1df39e522f4aa358012180fd4cf876af68aff78d
        chromium-mirror_third_party_dawn_buildtools::git+https://chromium.googlesource.com/chromium/src/buildtools.git#commit=9cac81256beb5d4d36c8801afeae38fea34b8486
        chromium-mirror_third_party_dawn_build::git+https://chromium.googlesource.com/chromium/src/build.git#commit=a6c1c751fd8c18d9e051b12600aec2753c1712c3
        chromium-mirror_third_party_dawn_tools_clang::git+https://chromium.googlesource.com/chromium/src/tools/clang.git#commit=06a29b5bbf392c68d73dc8df9015163cc5a98c40
        chromium-mirror_third_party_dawn_testing::git+https://chromium.googlesource.com/chromium/src/testing.git#commit=1bd0da6657e330cf26ed0702b3f456393587ad7c
        chromium-mirror_third_party_dawn_third_party_jinja2::git+https://chromium.googlesource.com/chromium/src/third_party/jinja2.git#commit=e2d024354e11cc6b041b0cff032d73f0c7e43a07
        chromium-mirror_third_party_dawn_third_party_markupsafe::git+https://chromium.googlesource.com/chromium/src/third_party/markupsafe.git#commit=0bad08bb207bbfc1d6f3bbc82b9242b0c50e5794
        chromium-mirror_third_party_dawn_third_party_glfw::git+https://chromium.googlesource.com/external/github.com/glfw/glfw.git#commit=b35641f4a3c62aa86a0b3c983d163bc0fe36026d
        chromium-mirror_third_party_dawn_third_party_zlib::git+https://chromium.googlesource.com/chromium/src/third_party/zlib.git#commit=209717dd69cd62f24cbacc4758261ae2dd78cfac
        chromium-mirror_third_party_dawn_third_party_abseil-cpp::git+https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp.git#commit=f81f6c011baf9b0132a5594c034fe0060820711d
        chromium-mirror_third_party_dawn_third_party_dxc::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectXShaderCompiler.git#commit=05334a70d3e5355fc86c94bb4e3cfe1c31a65999
        chromium-mirror_third_party_dawn_third_party_dxheaders::git+https://chromium.googlesource.com/external/github.com/microsoft/DirectX-Headers.git#commit=980971e835876dc0cde415e8f9bc646e64667bf7
        chromium-mirror_third_party_dawn_third_party_webgpu-headers::git+https://chromium.googlesource.com/external/github.com/webgpu-native/webgpu-headers.git#commit=8049c324dc7b3c09dc96ea04cb02860f272c8686
        chromium-mirror_third_party_dawn_third_party_khronos_OpenGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/OpenGL-Registry.git#commit=5bae8738b23d06968e7c3a41308568120943ae77
        chromium-mirror_third_party_dawn_third_party_khronos_EGL-Registry::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/EGL-Registry.git#commit=7dea2ed79187cd13f76183c4b9100159b9e3e071
        chromium-mirror_third_party_dawn_third_party_protobuf::git+https://chromium.googlesource.com/chromium/src/third_party/protobuf.git#commit=da2fe725b80ac0ba646fbf77d0ce5b4ac236f823
        chromium-mirror_third_party_dawn_tools_protoc_wrapper::git+https://chromium.googlesource.com/chromium/src/tools/protoc_wrapper.git#commit=b5ea227bd88235ab3ccda964d5f3819c4e2d8032
        chromium-mirror_third_party_dawn_third_party_jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=69098a18b9af0c47549d9a271c054d13ca92b006
        chromium-mirror_third_party_dawn_third_party_langsvr::git+https://github.com/google/langsvr.git#commit=303c526231a90049a3e384549720f3fbd453cf66
        chromium-mirror_third_party_dawn_third_party_partition_alloc::git+https://chromium.googlesource.com/chromium/src/base/allocator/partition_allocator.git#commit=2e6b2efb6f435aa3dd400cb3bdcead2a601f8f9a
        chromium-mirror_third_party_openscreen_src_third_party_tinycbor_src::git+https://chromium.googlesource.com/external/github.com/intel/tinycbor.git#commit=d393c16f3eb30d0c47e6f9d92db62272f0ec4dc7
        # END managed sources
        )
sha256sums=('25a356e4f2c7eb7da98746f4e38286b134401650367077cee626c75b79e66eb1'
            'b5fd4b943ae307680cd5c2050a01f85ef94d3f880a157eef8d17eb9fa23864f5'
            'b3de01b7df227478687d7517f61a777450dca765756002c80c4915f271e2d961'
            'a4a822e135b253c93089a80c679842cc470c6936742767ae09d952646889abd6'
            'dd2d248831dd4944d385ebf008426e66efe61d6fdf66f8932c963a12167947b4'
            '13fcf26193f4417fd5dfbc82a3f24e5c7a1cce82f729f6a73f1b1d3a7b580b34'
            '4484200d90b76830b69eea3a471c103999a3ce86bb2c29e6c14c945bf4102bae'
            '55dbe71dbc1f3ab60bf1fa79f7aea7ef1fe76436b1d7df48728a1f8227d2134e'
            'ff588a8a4fd2f79eb8a4f11cf1aa151298ffb895be566c57cc355d47f161f53f'
            '2c8cd28cee0e1df1862e801794f210d2b7cac652f943cf94f43c2abe26f2a2f4'
            'bc65f0103dace21fad32ce92fa3a4e703b13b34809babc3ae80be5f0748c6ae9'
            '0b7a546ee6913c49519c10c293ac530ff381641a8a465fa2e184d6dbe0fb784d'
            '07dc86368ae75c7605ef15ab9b95db07bdb53840b7ff5ccf8dc6014e13dcafcf'
            '3522166c3ca75316a172b7cc4fe12bba9367e30fed16df8193ede2e236dca8c5'
            'b7ab26b28122102827dbbefa54a38f9d59729bbdab889dcc6dba672141590717'
            '7b41bbe296d8db54365e8c88b57e91445c43dce0015e02e98746535e0fa9e691'
            'cd9fba4726dc5f418d43cc19ab50f7edbf778fa0b093cb1ca47c53f39c36e9cd'
            'dd3d9161c3f31f3a5b358b04e2eda0dababd2b257f7ce91751a7ac85deb6d2bc'
            '5abf726ce9e19c0b0e7818a7ced615a1a6d16f306e7315b9e6db53118c0669b5'
            '045eb27642ac8f49b52efec7c52bb6ea3c908552ffadc50449a23b27da7a4737'
            '8a8c21768a1f3764e6887cfc907dd857e9fc00a1269dd858e2ba98d70aef889d'
            '4d6164564f1fb641cb190966bf525a9d9ed5f30a09ee9d1d37e1d65624b09304'
            'b344c098926ab34bb1006f8dfaa8d2ebed9b9b62e77bb42aa689e4bf63093ece'
            'beb59e8ba1dc0d6ac5d6554aab88241b48e3c4465426e3caba790cddfca18cea'
            'ece1dee7d933f441230b956458bd3c134f31659cf112c85ec276f085391dd106'
            'de6dba1f7c67cb568c5f23e75a994422944ce46c01fc35bddae4ebc023a7145a'
            '7e1ca2ae7b7a926f9d8fff1f9b4ed832b7507a61f1d84ab44b5a6e49ce87e14a'
            '0e3ece6abcb4942e0c027294a23d689ff9dce5aacd8e958fdddc0f20d9873765'
            '89a368f0652d857d38402d6f3c5cded3c1757230ab7abe01df850a7bf8359119'
            'feeb06813819a42266bf6d6780f892b91dc2914d8ec7a00d26f8967fee76c566'
            'd064b2fee8eada35ce2fbed0b08e7b55625bf4ca0a55d3a2a2e1aab228ff2565'
            '48bdb7a462a52e890a9b8536d21924d0a4fe3f0dcb9a90a976fcd7a3e2526899'
            'bd07cc3f0dfa91629028ed53691eec8e0bf9bed7b3a602f4b8e78a7472e4e6fb'
            '9c231ea5f5fa3ade51cd45090c05441e54503a962e43ee4d5e10954197e2fa6e'
            '1df3cd67ce6f3c2835947ae75e38ff43f1d1f059fa2b8eecdd3b660a3e43860f'
            'af24f30b90d5942ecb89b9e5f373de70ec16ce590788a03a8d21f714bbca7337'
            'af28c9365fa0e41fc159b38e771458681e4721ceb1694500d8627faa94cf603b'
            '8b97c25874c17644300d1cbe6ac1fceb705bf18297e27699ba20497fc47ae239'
            '731f0c5b8c9a526c9bbd855aa7d509a5c018483d67f2284efd33148cccfe66d2'
            'e6a28c25e3d93c9c37414149ff44ac7a1bbb4d8a167061f8ee9679dc065af1bb'
            '9e950d9f0bf7f0b52de6744de0922583b4b32281e87f0488c2d1cfc533665aa5'
            '6125206b56f365874ba812038dbcd4271f8a73235ab4d211c42b7fd2d636bbc8'
            'afeeed068a01f09c576a0b33a0faf7fdb79552862cde5cb01622eb50c46629d7'
            '6ae7ae01b3c23f8bf7657a59427aac6f3216e041ebdb983b82c002a949bdb071'
            '987871bdaf2da13274350ab6123c54101835005258e48eb9202620c0504329f1'
            'c61fdfc3c3e59680dc8c0c7bea37624683225c7ee2411c398d80d213c101cb9a'
            'a5f352d1796111fa995f7cffb22682e64aa4f34f2b0a76f6595470647e724e95'
            '1b904747f0017190fd28c4416c51a33bb272b38a2ad97b390f55da5254341bbc'
            '47f3f3d044cc0658274833022db1e7695964b1da8f37cb905882d15457212fba'
            '603f4562aa57be18b5d6b31497013476b2436a17b94ec66c775244157567a9df'
            '6258126c4c354ccacd0ec5f9f82c6970d576359c7aba86e44277b459d1645325'
            '64ba2842c41f7f9cffaf13269cb1a6b64211bbb02b65ae0aba0d93caca1627ef'
            '9460875312e5ac35daabf2823ffe69142ebe1a88c3005b222deda0f14bf4cfa8'
            'cf96ae84ef29434dd20b0f2daca6013373dd6e47c87cde3aa03abce0500a9f03'
            '7df2a26df1b8e69c58692295443e18de9f19bc0107bd5911beed53157a592ad3'
            '0db8417b0fd669b95227c266cbc578af1f5e00198fd24f51fee8cfcfccb8b06b'
            '5d0c4f261d36707f926fa9ef9a39349f1cccac8ae6443a8f8571c1625eb90c41'
            '1a1e2859649a95beef8dba22e8c77735652a212bc88a9bb4dfe1458667dcabbc'
            '792d29bbb3fdcfdf21face515e6b9fba1a14ee7bdc82f0cff9620592925425c9'
            '066f9918c78174b70150bdc983983673226b3d69a390c598632380a338d505b0'
            '12081574c11ef21850e9d2cf62580216296a6b7af48f679e6c28e05a376d1f3d'
            '0f27ab5434870f31886d7c958ced4ff335a09a1080637fb50afdf95db19e3442'
            'd0697f71f188829bcb9e98b229340ea77ee1c5185a02168ac509fbd5c02e7b1b'
            '753cb94b49f25fd25aa045569722d4780591bf060f17644d9b78e7e83b3fdfc8'
            'c14fec7ed820b7a55ad8ec0c6681f769023de24e3846a16cf43fda8ced0eb4cc'
            'af81f653b73270d4b8f9d1e92ecf39821498c08f4ca5c69872e39bac90b40083'
            '6ae17c7b6b1a897550f3b099f4f8f1ca84eb41c3f1d7711d43359040a5450495'
            'f879f1c418cf053071b024df7fa3f9beee99259e2391e1c3ccf3a12859e98eb2'
            '92fe0e99dea519a56b80321646b7b2b674564f4e8d036cbbf4d98e8588531720'
            '1003d83645cd2de46dd087e3fa3c6281464b0322c68fa8a95a1401b8548eb59c'
            '9f58ce3d45baf6796965aa79109af62c330f82b97d320bb5d7bbbdea0e579a92'
            '739e5654f283ec4d5bf2a54f4d13d4979a92cfb035b407e6736d58203c3a4266'
            'ce15a6a958184541728c1cc685c1e4ee07334e9fc8d22c631e446a282c924566'
            'afbb351256f7696d783c45dcf8aa63f963067700d29b72118be605715708e04a'
            'c2eb3aee5d91aa9d80d651d5bc26ae729e9a5bdd2f62985ca394cebac5b8174f'
            '63e3cc92fb9b5b9181082eb8ba1574a11e4c36272d10930c4bd7610fed17308a'
            '6ab62251aee14c555ec48f3002014f36072eb8a36be6320d0617a26b259927ce'
            '5dd471fdb73bfeba122d7325eba89cc8d0a4682c193835198bcf2fac31fabe99'
            '59389cd355822c97d9109137381a7016e40f8c60501dcd1c8c5fe45a7817ae24'
            '46890b0f4deddc446e5ec9de234b78163d43c593f39edc1c4b04b721d49850d7'
            'a744e9950837d378528c5a926d0d39790686ae9ccf7f7319d54f8fdb2ebb955b'
            'ac36790b054f2b0fbc5bcb64951ee2f77201d3795d5ccf590adc78b5bc7cb6e2'
            '66b8f66432b1325861b5f411c71ec49fa171d9a0063bf958242ddde6ce09c12f'
            'f849a0242720e6389140b7d7853e9f56186bac9793aea5e7b9b713d76847c398'
            '9c888babaaf59afc855d944e8b26ab573d5e80026dc3bc8dc64720b8f5bb27a2'
            'e257a81dc043c2a3de254e631ccd3ec38c0996d5769baf36a0dee4cfa471489b'
            'ae2c189d21dcd056116ee1c3d54b5ae3874e5ac0cc2086c137625b618334cbb1'
            'dd3fe1521ff5bc4481bfd447d62322417f069371d107d5df2df8134b0a1bfd79'
            'fe2f23319ca61ecb2fac8e586ad71fe36ba340fd4f5c4d0372d0e119d5c264e0'
            '3bb4ad9e05483ad8cadd9bf9d7ca0e2e16fd4eb1495ef36f4858be22c2eb31b2'
            '4070e77bf7afd9fb949067f63c3580d1f5badacfe4c2ab187129ba20446efd04'
            '9c8de69ad47af04565a89920c08f44694f97d7a16f8f23610e5beaf9f38cb71c'
            '25906418111df0d29db783092d94148e130592d722393ad4bd76809c6f63f9bd'
            '1e7f1fbf8818b35e61f32ed2c6bc0e8808e53ab87f45c8aa6df35daf3f14b720'
            '9341676174943fbc5268e023c3e572171289fc4748401723a6dcaef50f793dcd'
            '58edd34b8a7da6b03b85ba66a440fec532bb91c7f0f6403f795721c6c20b47e1'
            '77e3ec7142195e044be4662611f6c31407ae8486dcaa7bd1bd03bb1315250cb2'
            'c06f2a92cd606654ec565c2fa728e755eaaf7e7a41fb7bd217988274a411c320'
            '3ef2ceefb957472fda2a29cef2936a49be60694971f63533c04121a48775bcdb'
            'e475d42b746955422ff9e905354091d0b17cdb2c8989cc6beb6470e76a4aa1dd'
            'f2aba031573fc4929d2bd9d03e4b18c4385f399fa0b605eca35898567ebdf7b4'
            '9010695b87eef676b62ec429879972c135987dab6eb53b0a4edf1b5a7cb0bb8b'
            '3d55fa9e1d628aed3e127b6fb4d3dd47b7ada7b865f683f52e21a51043827479'
            'd1c16289a7869f143d72e6d574d4f27f439fd2fd027064dcce1dd6a6aee75d00'
            '3cd40fbd2ac25f213a6c26c1e86d9644fce7423368149fb22c71e004ca6c9553'
            'd9f818c99353d14bafcb184aa6d48e1b64af44d789647b2d11b6db33b44c39a3'
            '737a2b60713f602b487a67a49c8817d5423218d546943cfe49a57e50c2101d89'
            '7e60f4bbd81cab485d7fcaa33d08a33c1fb2ba25692f4b630a43befa5bb5caaf'
            '8c4762afa73b8da6307a29568ef911a12c0e78604d9ffacfc9de8fef94ae0644'
            '78f5096d2d425b9663cb289964d994c9a15db7938c5a1a35cc4b286014ca2545'
            '00f4fa0ff1741c69c12af0c14a8c60b0b3a28e44c04beee3d61fc7982a6aea5d'
            '99995f0ca85ab0e85bd291e5336657df41409a48ca5439dcaf162d8b11ac0ec6'
            'dc1206af7485794e1644097b08736e39c8fa50296e514561f8805c6d28b58925'
            '599bbbabf9e2dc2006dd9e3e9636c4f648360726173793bf6a5a5414698762c5'
            'b7a7a43eae0f41a9e18f54c2334d5797a547238b76d64d59ede26a4d6621de0d'
            '39d7dd8b6721a427dae2ca577d5f003459563928850757c519be96cb4064e933'
            '3f87f41f353d481f0d72fbf556438b55c57bdaaaa5ee16b0f23fdcbc09153c62'
            '3624b28203c972ea54b490342be74fbd99d4b4748123f9e2837a54ca01c8b392'
            'bd724ee01b93651b4ec6ba62ba64d23e153ea7100be760ccaee4a1e6e32787a6'
            '1a94dc238b495ea06f98e8876591691eddfc41e3980b84624fd0834add444afb'
            'e01b3e6561e1fee89c219268d7d81b7f77f662effba775afdb4afaa74e5fb3d2'
            '108a67f21c2bdf2dbc4838f3ba32c992325a29cb62a14b377f8a04a9ad5b2b82'
            '8071a982148157f5b29380162de4ad574d83428b8996f7e59d0b280fc13ec45c'
            '1fdb5cda70de044cb82f90a67d8602d6b3bcf989406e77e8f31c5d006ef81655'
            '4248a72203e6100b4163d21fd134a97ab13418ed433bb6ae1988c6a5dfe5e038'
            '0f18fde832017387600b5ee2ec6a0ae82125c82b97c0f717772f3cd5dfdcd57b'
            'f491729861848be47a4e9c523dc812d2c9e9581d0284851feddc71a2c52eba2d'
            'b7313436b7512bebca6ba302c32b906e25e9ca088b2e18269946a75071a2d7f9'
            'af39f31c3a6b8fe31075509ea28874fad9427e6e9d239327d74167a660a2aea0'
            'cb2de3aa11a8d7df19ff358f0d5426bf167f5f2d11609c60f3b34558364edcc7'
            'a0c83ec874a9887ecacacf1f6f272de51f3e2d255b46864a942d94816358a581'
            'c58ddcbbdffc8373f2e953ae4893919319d949d3fa352f29677fe10a43c343b4'
            '2fe84deb6c7b6165e4bc266c0b6e89000b67d9076abc54bff42bfb53b3d750f3'
            '913fc3a85ae676025bafe63880c6413ffafe42495a04a52527ee914ee9ba3ae5'
            '8ee0bade4127e082dc1ae86f0068aa32ea0fbce26069ed2d9dbdef324e1bb980'
            '900f9249e65a3bf0189f3e32c6a2d84bd88b9b3a7d7cfba8c12c1be0d78dd31f'
            '1da28304d237ba934e76394107e46fed0e4120fd2b257f1c667c2d11b52d959b'
            'a9a8839d08232091a0cd381f51380a0a6ebe841f5a8e50a6047aae7b8e34c681'
            '02696a90c7831e3fa903df105573c5f10f4934602fb0e90c846fb44213c40b27'
            '61fea61df2b6f8755ba04d6f068a7750e89eb08a638f983626720fe147151a60'
            'c70788d37f4fb63ec695acb571b84571f3679265e3818914b7b25960398d0bec'
            '502e45fcb8952d1755b535a82c48e4a1d345affe69ecc942f5e434fd94cb1335'
            '0c9106a2bef658f02b2312d081faad6ba8a72bbb5b4ee1cae7d0a95e4ef53f8f'
            '04a61e218b3a10ec3cf58e3fe12fb2ea23610f03889d19b31b8ccb3b078efd6e'
            '910bc5d9e7523ccd09506bafe3fac586db5106d8cc72d77e8457fdf8b43c225e'
            '2e1ca25433ac8176d4e2d719936a90d8cc5aab474a960bb2411fbe123ceab23e'
            '548c8cd89cf822c790e4703eff53756791450eba73d267a84f3bf3eedf60bef5'
            '4518249219bef02aed2859f60f2b3478a42615153d573ee12dec2dca61b145de'
            'f5d55764d3724182d8a4d39007644a105cdac50bd2726af5b56937301aca4888'
            'e67cdb017c07a7ec72a06f1062dc2f124d97527869604575fe48610ff98b581a'
            '716cc81139f11a2b438802d37f245f885fc9a0c69ef429a11b156145c903a932'
            '9904b8fd280616681364b19324b58f2e2b9b31441d98974025a1630cef44a73a'
            '2a4e7b307dd0c1b88608e60e13a6ae0baf0995765f896f5b622cdc3d067e42d2'
            '26abc865fd39a6f65cc1f69383e66820e22fca6e7ab535f5aa8e5c793d81f178'
            '6423bbb0a07f8f45cc87d874c0eed1827bb5fc08c361884cb318fa361643024d'
            '64633f7373b79cb3e3a7c221f1a8a6033ea6d14fc3234fdb52facc4c1ab2fb24'
            'b48490fbcdad8becc160f2dab2ee4a0f67327f1e9d9ddbd96e44150175c68ca9'
            '0b95ed21612b4f02e65643f2029d8ce5710f49dbe8b229350bbe643167a4b83b'
            '9bd1e05f5128b4715c2d354a6895839d01aae4fc9f56b9d0411afc87fb46daf4'
            '3ae63a893b5b585823f04b5a2e604d3df4c7c6e311f5da5b5d5af92a1fd00465'
            'd1bea5be4ca41f2e9f29354bc3bdf12d9bba47778eb6fa6b01db053a831f3b42'
            '47b4765ed6a2c5440103ae87f759ec05b1ef418af06c200f5b0d80ac1ff5fdb7'
            'f7f5d15365443cbd8137445c3aedf8ccd31c3402f72c0fa7c16e7bf1c7977139'
            'b4b2001119694d538dd97c110809503d8ac514caba65f98d11be7ae00c307299'
            'f8627f5f3a7c119807afc9dc66ce7cb350f905fd1db7fb6b0077552974a07515'
            'ac3f025aa27fec77b24b443df3a69750dc9bb070a40af5180d031b81e66e328c'
            '9c09dfbb8ebed025ec8ba34bf95c80fe30dd69eee5a02945c0357ce253d9dcbc'
            '8bd1361cf5c6e4e3336cad5b37c79dcc986a46b99e4ad7d679da146dd1fdb7fe'
            '868159a9a965cebd40f98f5995d6ac6361869904712c1b62c6b8a67d10dd93b4'
            'bde40f830d8edac53f2682acd50bf7db2632cb31c6ddaa1923a8703a58899e11'
            '37bd9bc812c1bfc471be2eb003f714e475f8425913c42703b21237f2b1c99e57'
            'c23fa31250811a76be900554b9ac127f861ebde09c07ac67cd6b82dd214e5686')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
# plus any so names that are provided + linked
declare -gA _system_libs=(
  [brotli]=brotli
  # [dav1d]="dav1d libdav1d.so"
  # [ffmpeg]="ffmpeg libavcodec.so libavcodec.so libavformat.so libavutil.so" # YouTube playback stopped working in Chromium 120
  [flac]="flac libFLAC.so"
  [fontconfig]="fontconfig libfontconfig.so"
  [freetype]="freetype2 libfreetype.so"
  [harfbuzz-ng]="harfbuzz libharfbuzz.so libharfbuzz-subset.so"
  [icu]="icu libicui18n.so libicuuc.so"
  # [jsoncpp]="jsoncpp libjsoncpp.so"  # needs libstdc++
  # [libaom]=aom
  # [libavif]=libavif # libavif.so libavutil.so # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libdrm]=libdrm # libdrm.so
  [libjpeg]="libjpeg-turbo libjpeg.so"
  [libpng]="libpng libpng16.so"
  # [libvpx]=libvpx
  # [libwebp]="libwebp libwebpdemux.so libwebpmux.so libwebp.so" # //third_party/libavif:libavif_enc needs //third_party/libwebp:libwebp_sharpyuv
  [libxml]="libxml2 libxml2.so"
  [libxslt]="libxslt libxslt.so"
  [opus]="opus libopus.so"
  # [re2]="re2 libre2.so" # needs libstdc++
  # [snappy]=snappy # libsnappy.so # needs libstdc++
  # [woff2]="woff2 libwoff2dec.so" # needs libstdc++
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
  #export VPYTHON_BYPASS='manually managed python not supported by chrome operations'

  echo "Putting together electron sources"
  # Generate gclient gn args file and prepare-electron-source-tree.sh
  python makepkg-source-roller.py generate electron/DEPS $pkgname
  rbash prepare-electron-source-tree.sh "$CARCH"
  mv electron src/electron

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
  # needs newer clang to read the bundled PGO profile
  # src/tools/update_pgo_profiles.py --target=linux update \
  #   --gs-url-base=chromium-optimization-profiles/pgo_profiles

  # https://gitlab.archlinux.org/archlinux/packaging/packages/electron32/-/issues/1
  src/third_party/node/update_npm_deps

  src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json

  # https://github.com/nodejs/node/issues/48444
  export UV_USE_IO_URING=0

  pushd src
  pushd electron
  yarn install --frozen-lockfile
  popd

  echo "Applying local patches..."

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  patch -Np0 -i ../blink-fix-missing-stdlib-include.patch

  ## Upstream fixes

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-128-compiler.patch
  patch -Np1 -i ../chromium-patches-*/chromium-130-interference-size.patch

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -sfn /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  mkdir -p third_party/jdk/current/bin
  ln -sfn /usr/bin/java third_party/jdk/current/bin/
  ln -sfn /usr/bin/clang-format buildtools/linux64

  # test deps are broken for ui/lens with system ICU
  # "//third_party/icu:icuuc_public" (taken from Gentoo ebuild)
  sed -i '/source_set("unit_tests") {/,/}/d' chrome/browser/ui/lens/BUILD.gn
  sed -i '/lens:unit_tests/d' chrome/test/BUILD.gn components/BUILD.gn

  # Electron specific fixes
  patch -Np1 -i "${srcdir}/jinja-python-3.10.patch" -d "third_party/electron_node/tools/inspector_protocol/jinja2"
  patch -Np1 -i "${srcdir}/use-system-libraries-in-node.patch"
  # patch -Np1 -i "${srcdir}/default_app-icon.patch"  # Icon from .desktop file

  # Allow building against system libraries in official builds
  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py
  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
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
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_hangout_services_extension=true'
    'enable_widevine=false'
    'enable_nacl=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  local _clang_version=$(
    clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

  _flags+=(
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    "clang_version=\"$_clang_version\""
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
  )

  # Allow the use of nightly features with stable Rust compiler
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
  export RUSTC_BOOTSTRAP=1

  _flags+=(
    'rust_sysroot_absolute="/usr"'
    'rust_bindgen_root="/usr"'
    "rustc_version=\"$(rustc --version)\""
  )

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
